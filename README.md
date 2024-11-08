# SharedPreferences.jl

[![CI](https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/SharedPreferences.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/SharedPreferences.jl/graph/badge.svg?token=FPKzhDwSAB)](https://codecov.io/gh/raphasampaio/SharedPreferences.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

SharedPreferences.jl is a Julia package that provides persistent storage for simple data types. Inspired by the widely-used Dart package, this library supports asynchronous disk persistence, offering a flexible and user-friendly solution for storing non-critical data securely.

## Features

- Easy and consistent API for storing and retrieving data.
- Asynchronous disk storage with encryption options for enhanced data security.
- Designed for storing preferences, settings, and lightweight non-critical data.

## Getting Started

### Installation

```julia
julia> ] add SharedPreferences
```

### Example

Below is a sample usage demonstrating how to securely store and retrieve different data types using SharedPreferences.jl:

```julia
using SharedPreferences

# encryption key for secure storage
key = "JjL9kX9BRNsHa6ykI8s8eV9ZX2Wb1Fsf"

# create an encrypted instance of SharedPreferences
instance = SharedPreferences.InstanceEncrypted(key)

# store data of various types
set!(instance, "string", "value")
set!(instance, "integer", 42)
set!(instance, "float", 3.14)
set!(instance, "boolean", true)
set!(instance, "array", [1, 2, 3])

# retrieve stored data
instance = SharedPreferences.InstanceEncrypted(key)

stored_string = get(instance, "string")
stored_integer = get(instance, "integer")
stored_float = get(instance, "float")
stored_boolean = get(instance, "boolean")
stored_array = get(instance, "array")

println("Stored string: ", stored_string)
println("Stored integer: ", stored_integer)
println("Stored float: ", stored_float)
println("Stored boolean: ", stored_boolean)
println("Stored array: ", stored_array)
```

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to open an issue or submit a pull request.
