module CliPackages

using ArgParse
using Crayons
using PrettyTables
using ProgressMeter
using TerminalMenus

# Optional re-exports
export ArgParse, Crayons, PrettyTables, ProgressMeter, TerminalMenus

# Optional: Scaffolding helper
function scaffold(path::String="cli_app")
    mkpath(path)
    open(joinpath(path, "main.jl"), "w") do io
        write(io, """
        using CliPackages

        args = Dict("verbose" => true)

        println(Crayon(foreground=:green)("Hello from your CLI!"))

        pretty_table([["Item 1", "OK"], ["Item 2", "Fail"]], ["Name", "Status"])

        @showprogress 1 "Loading..." for i in 1:100
            sleep(0.01)
        end
        """)
    end
    println("✅ CLI app scaffolded at $path/main.jl")
end

end # module
