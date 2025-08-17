module TestAqua

using Aqua
using SharedPreferences
using Test

@testset "Aqua" begin
    Aqua.test_ambiguities(SharedPreferences, recursive = false)
    Aqua.test_all(SharedPreferences, ambiguities = false)
    return nothing
end

end
