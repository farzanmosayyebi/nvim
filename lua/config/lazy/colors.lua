return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    dark = "mocha",
                    light = "mocha",
                },

                transparent_background = true,
                show_end_of_buffer = false,
                default_integrations = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },

                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                },
                -- custom_highlights = function(colors)
                --     return {
                --         Comment = { fg = colors.flamingo }
                --     }
                -- end
            })
            vim.cmd.colorscheme "catppuccin-mocha"

            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#8492b3', bold = false })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = false })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#8492b3', bold = false })
        end
    },
    {
        "feline-nvim/feline.nvim",
        config = function()
            vim.opt.laststatus = 3
            local ctp_feline = require('catppuccin.groups.integrations.feline')

            ctp_feline.setup()

            require("feline").setup({
                components = ctp_feline.get(),
            })

            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    package.loaded["feline"] = nil
                    package.loaded["catppuccin.groups.integrations.feline"] = nil
                    require("feline").setup {
                        components = require("catppuccin.groups.integrations.feline").get(),
                    }
                end,
            })

            vim.cmd("set cmdheight=0")
        end
    }
}
