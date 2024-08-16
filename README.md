# SharedPreferences.jl

[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://raphasampaio.github.io/SharedPreferences.jl/stable)
[![CI](https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/SharedPreferences.jl/graph/badge.svg?token=FPKzhDwSAB)](https://codecov.io/gh/raphasampaio/SharedPreferences.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

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

instance = SharedPreferences.InstanceEncrypted(key)
set!(instance, "string", "value")
set!(instance, "integer", 42)
set!(instance, "float", 3.14)
set!(instance, "boolean", true)
set!(instance, "array", [1, 2, 3])

instance = SharedPreferences.InstanceEncrypted(key)
string = get(instance, "string")
integer = get(instance, "integer")
float = get(instance, "float")
boolean = get(instance, "boolean")
array = get(instance, "array")

```
