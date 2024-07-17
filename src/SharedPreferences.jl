module SharedPreferences

using Nettle
using TOML

export set!, get, remove!, clean!

include("instance.jl")

end
