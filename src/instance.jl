abstract type AbstractInstance end

struct Instance <: AbstractInstance
    path::String

    function Instance(file::AbstractString)
        directory = tempdir()
        path = joinpath(directory, "$file.toml")

        return new(
            path,
        )
    end
end

struct InstanceEncrypted <: AbstractInstance
    encryptor::Nettle.Encryptor
    decryptor::Nettle.Decryptor
    path::String

    function InstanceEncrypted(key::AbstractString)
        @assert length(key) == 32

        directory = tempdir()
        file = hexdigest("sha256", key)
        path = joinpath(directory, file)

        return new(
            Encryptor("AES256", key),
            Decryptor("AES256", key),
            path,
        )
    end
end

function load(instance::Instance)
    if !isfile(instance.path)
        return Dict{String, Any}()
    end

    return TOML.parsefile(instance.path)
end

function load(instance::InstanceEncrypted)
    if !isfile(instance.path)
        return Dict{String, Any}()
    end

    file = open(instance.path, "r")
    encrypted = read(file, String)
    close(file)

    decrypted = trim_padding_PKCS5(decrypt(instance.decryptor, encrypted))

    return TOML.parse(String(decrypted))
end

function save(instance::Instance, content::Dict)
    open(instance.path, "w") do io
        TOML.print(io, content)
    end

    return nothing
end

function save(instance::InstanceEncrypted, content::Dict)
    serialized = sprint(io -> TOML.print(io, content))
    encrypted = encrypt(instance.encryptor, add_padding_PKCS5(Vector{UInt8}(serialized), 16))

    file = open(instance.path, "w")
    write(file, encrypted)
    close(file)

    return nothing
end

function set!(instance::AbstractInstance, key::AbstractString, value::Any)
    dict = load(instance)
    dict[key] = value
    save(instance, dict)
    return nothing
end

function Base.get(instance::AbstractInstance, key::AbstractString)
    dict = load(instance)
    return dict[key]
end

function Base.get(instance::AbstractInstance, key::AbstractString, default::Any)
    dict = load(instance)
    return get(dict, key, default)
end

function remove!(instance::AbstractInstance, key::AbstractString)
    dict = load(instance)
    delete!(dict, key)
    save(instance, dict)
    return nothing
end

function clean!(instance::AbstractInstance)
    rm(instance.path, force = true)
    return nothing
end