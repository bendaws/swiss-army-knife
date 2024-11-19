function init()
    -- Forgot what to put here lol
end

local swiss = {
    name = "swiss-army-knife", -- Name of your plugin (no spaces / special characters)
    version = "1.0.0", -- Version (if you have a versioning system, otherwise leave as 1.0.0)
    description = "Cardboard plugin for powerful and cool tools", -- What your plugin does in 50 words or less
    author = "ben3333", -- Your name

    commands = {
        {
            name = "run",
            description = "Run lines of Lua code",

            onCommandRun = function(args: {string})
                local compiled_code = {};
                local _: boolean, errorMsg: string = pcall(function()
                    for idx, _ in args do
                        compiled_code[idx] = loadstring(args[idx])
                    end
                end)

                if errorMsg == nil then
                    for idx, fun in compiled_code do
                        print(compiled_code[idx]())
                    end
                else
                    warn(string.format("error while compiling: %s", errorMsg))
                end
            end,
        },
        {
            name = "swiss-army-knife",
            description = "Swiss army knife installation test",

            onCommandRun = function(args: {string})
                print("swiss-army-knife")
                print("(C) 2024 ben3333 - MIT/BOSL3")
            end,
        },
    },

    onPluginInitialization = init,
}

return swiss