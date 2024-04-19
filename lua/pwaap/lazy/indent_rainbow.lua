return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
        "TheGLander/indent-rainbowline.nvim",
    },

    opts = function(_, opts)
        opts = {
            indent = { char = "" }
        }

        return require("indent-rainbowline").make_opts(opts, {
            color_transparency = 0.05,
        })
    end
}

