module SharedPreferences

using Nettle
using TOML

export SharedPreferencesInstance, set!, get, remove!

include("instance.jl")

end
