module TestSharedPreferences

using SharedPreferences
using Test

function test_shared_preferences(instance::SharedPreferences.AbstractInstance)
    clean!(instance)

    set!(instance, "string", "value")
    set!(instance, "integer", 42)
    set!(instance, "float", 3.14)
    set!(instance, "boolean", true)
    set!(instance, "array", [1, 2, 3])

    @test get(instance, "string") == "value"
    @test get(instance, "integer") == 42
    @test get(instance, "float") == 3.14
    @test get(instance, "boolean") == true
    @test get(instance, "array") == [1, 2, 3]

    remove!(instance, "string")
    remove!(instance, "integer")
    remove!(instance, "float")
    remove!(instance, "boolean")
    remove!(instance, "array")

    @test_throws KeyError get(instance, "string")
    @test_throws KeyError get(instance, "integer")
    @test_throws KeyError get(instance, "float")
    @test_throws KeyError get(instance, "boolean")
    @test_throws KeyError get(instance, "array")

    @test get(instance, "string", "value") == "value"
    @test get(instance, "integer", 42) == 42
    @test get(instance, "float", 3.14) == 3.14
    @test get(instance, "boolean", true) == true
    @test get(instance, "array", [1, 2, 3]) == [1, 2, 3]

    clean!(instance)

    return nothing
end

@testset "Shared Preferences" begin
    instance = SharedPreferences.Instance("vG1Z4i52FR")
    @testset "instance" begin
        test_shared_preferences(instance)
    end

    instance = SharedPreferences.InstanceEncrypted("gIU2iw4p10KnP2HsU5TBJ5Uuj5Khj2R0")
    @testset "instance encrypted" begin
        test_shared_preferences(instance)
    end
end

end
