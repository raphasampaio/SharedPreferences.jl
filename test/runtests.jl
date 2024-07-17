using SharedPreferences

using Aqua
using Test

function test_all()
    @testset "Aqua.jl" begin
        @testset "Ambiguities" begin
            Aqua.test_ambiguities(SharedPreferences, recursive = false)
        end
        Aqua.test_all(SharedPreferences, ambiguities = false)
    end

    key = "iZS1EDuzE5dEf3NmN8m3SbwOJEpu4b0i"

    instance = SharedPreferences.Instance(key)
    clean!(instance)

    instance = SharedPreferences.Instance(key)
    set!(instance, "string", "value")
    set!(instance, "integer", 42)
    set!(instance, "float", 3.14)
    set!(instance, "boolean", true)
    set!(instance, "array", [1, 2, 3])

    instance = SharedPreferences.Instance(key)
    @test get(instance, "string") == "value"
    @test get(instance, "integer") == 42
    @test get(instance, "float") == 3.14
    @test get(instance, "boolean") == true
    @test get(instance, "array") == [1, 2, 3]

    instance = SharedPreferences.Instance(key)
    remove!(instance, "string")
    remove!(instance, "integer")
    remove!(instance, "float")
    remove!(instance, "boolean")
    remove!(instance, "array")

    instance = SharedPreferences.Instance(key)
    @test_throws KeyError get(instance, "string")
    @test_throws KeyError get(instance, "integer")
    @test_throws KeyError get(instance, "float")
    @test_throws KeyError get(instance, "boolean")
    @test_throws KeyError get(instance, "array")

    instance = SharedPreferences.Instance(key)
    clean!(instance)

    return nothing
end

test_all()
