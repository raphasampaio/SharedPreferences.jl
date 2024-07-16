using Documenter
using SharedPreferences

DocMeta.setdocmeta!(SharedPreferences, :DocTestSetup, :(using SharedPreferences); recursive = true)

makedocs(
    sitename = "SharedPreferences",
    modules = [SharedPreferences],
    authors = "Raphael Araujo Sampaio",
    repo = "https://github.com/raphasampaio/SharedPreferences.jl/blob/{commit}{path}#{line}",
    doctest = true,
    clean = true,
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://raphasampaio.github.io/SharedPreferences.jl",
        edit_link = "main",
        assets = [
            "assets/favicon.ico",
        ],
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(
    repo = "github.com/raphasampaio/SharedPreferences.jl.git",
    devbranch = "main",
    push_preview = true,
)
