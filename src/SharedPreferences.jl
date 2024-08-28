module SharedPreferences

using Nettle
using PrecompileTools: @compile_workload
using TOML

export set!, get, remove!, clean!

include("instance.jl")

@compile_workload begin
    instance = SharedPreferences.Instance("OMcXi7eR")
    clean!(instance)

    instance = SharedPreferences.InstanceEncrypted("Q0K38aFg7aSbVvDAgnDhgBF1CWyTfLlH")

    set!(instance, "string", "value")
    set!(instance, "integer", 42)
    set!(instance, "float", 3.14)
    set!(instance, "boolean", true)
    set!(instance, "array", [1, 2, 3])

    _ = get(instance, "string")
    _ = get(instance, "integer")
    _ = get(instance, "float")
    _ = get(instance, "boolean")
    _ = get(instance, "array")

    remove!(instance, "string")
    clean!(instance)
end

end
