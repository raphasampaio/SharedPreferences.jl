# SharedPreferences.jl

<div align="center">
    <a href="https://raphasampaio.github.io/SharedPreferences.jl/stable">
        <img src="https://img.shields.io/badge/docs-stable-blue.svg" alt="Stable">
    </a>
    <a href="https://raphasampaio.github.io/SharedPreferences.jl/dev">
        <img src="https://img.shields.io/badge/docs-dev-blue.svg" alt="Dev">
    </a>
    <a href="https://pkgs.genieframework.com?packages=SharedPreferences">
        <img src="https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/SharedPreferences/label:-sep:">
    </a>
    <br>
    <a href="https://juliahub.com/ui/Packages/SharedPreferences/sHGR0">
        <img src="https://juliahub.com/docs/SharedPreferences/version.svg" alt="Version"/>
    </a>
    <a href="https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml">
        <img src="https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml/badge.svg" alt="CI"/>
    </a>
    <a href="https://codecov.io/gh/raphasampaio/SharedPreferences.jl">
        <img src="https://codecov.io/gh/raphasampaio/SharedPreferences.jl/branch/main/graph/badge.svg" alt="Coverage"/>
    </a>
    <a href="https://github.com/JuliaTesting/Aqua.jl">
        <img src="https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg" alt="Coverage"/>
    </a>
</div>

## Introduction
SharedPreferences.jl is a Julia package that provies a persistent storage of simple data. Based on the popular Dart package, it supports asynchronous disk persistence, offering flexibility and ease of use for storing non-critical data.

## Getting Started

### Installation

```julia
julia> ] add SharedPreferences
```

### Example
```julia
using SharedPreferences

key = "JjL9kX9BRNsHa6ykI8s8eV9ZX2Wb1Fsf"

instance = SharedPreferencesInstance(key)
set!(instance, "string", "value")
set!(instance, "integer", 42)
set!(instance, "float", 3.14)
set!(instance, "boolean", true)
set!(instance, "array", [1, 2, 3])

instance = SharedPreferencesInstance(key)
string = get(instance, "string")
integer = get(instance, "integer")
float = get(instance, "float")
boolean = get(instance, "boolean")
array = get(instance, "array")

```
