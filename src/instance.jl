struct SharedPreferencesInstance
    encryptor::Nettle.Encryptor
    decryptor::Nettle.Decryptor
    path::String

    function SharedPreferencesInstance(key::AbstractString)
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

function load(instance::SharedPreferencesInstance)
    file = open(instance.path, "r")
    encrypted = read(file, String)
    close(file)

    decrypted = trim_padding_PKCS5(decrypt(instance.decryptor, encrypted))

    return TOML.parse(String(decrypted))
end

function save(instance::SharedPreferencesInstance, content::Dict)
    serialized = sprint(io -> TOML.print(io, content))
    encrypted = encrypt(instance.encryptor, add_padding_PKCS5(Vector{UInt8}(serialized), 16))

    file = open(instance.path, "w")
    write(file, encrypted)
    close(file)

    return nothing
end

function set!(instance::SharedPreferencesInstance, key::AbstractString, value::Any)
    toml = load(instance)
    toml[key] = value
    save(instance, toml)
    return nothing
end

function Base.get(instance::SharedPreferencesInstance, key::AbstractString)
    toml = load(instance)
    return toml[key]
end

function remove!(instance::SharedPreferencesInstance, key::AbstractString)
    toml = load(instance)
    delete!(toml, key)
    save(instance, toml)
    return nothing
end