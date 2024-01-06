local function header()
	return [[
                .&(            &@             /&,
              &&&&(           @@@@@           /&&&@
           ,&&& .&(         @@@@@@@@@         /&, %&&*
         .&&    .&(       @@@@@@@@@@@@        /&,    &&,
         .&     .&(      @@@@@@@@@@@@@@@      /&,     &,
         .&     .&(    @@@@@@@@@@@@@@@@@@@    /&,     &,
         .&     .&(  @@@@@@@@@@. @@@@@@@@@@.  /&,     &,
         @&     .&( @@@@@@@@@@     @@@@@@@@@@ /&,     &,
         &&     &&@@@@@@@@@@        %@@@@@@@@@@&&     &,
         &&   &&&@@@@@@@@@@           @@@@@@@@@@@&&   &,
         && %&&@@@@@@@@@@               @@@@@@@@@@&&% &,
         .&&&@@@@@@@@@@%                 #@@@@@@@@@(&&&,
            &@@@@@@@@@                     &@@@@@@@@@
               @@@@@                        *@@@@@.
                 %#          NEOVIM           (&
  ]]
end

return {
    {
        'echasnovski/mini.nvim',
        version = false,
        init = function()
            require('mini.comment').setup({
                mappings = {
                    comment = 'gc', -- Toggle comment (like `gcip` - comment inner paragraph) for both Normal and Visual modes
                    comment_line = 'gcc', -- Toggle comment on current line
                    comment_visual = 'gc', -- Toggle comment on visual selection
                    textobject = 'gc', -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                },
            })
            require('mini.completion').setup({
                window = {
                    info = { border = 'rounded' },
                    signature = { border = 'rounded' },
                }
            })
            vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
            vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

            require('mini.cursorword').setup()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
            require('mini.indentscope').setup({symbol = '┊'})
            require('mini.jump').setup()
            require('mini.jump2d').setup({
                -- Characters used for labels of jump spots (in supplied order)
                labels = 'aoeiudrtnspyfgchlbkxmj',
            })
            require('mini.pairs').setup()
            require('mini.splitjoin').setup()
            require('mini.sessions').setup()
            local starter = require("mini.starter")
            starter.setup({
                evaluate_single = true,
                header = header,
                items = {
                    starter.sections.builtin_actions(),
                    starter.sections.recent_files(10, false),
                    starter.sections.recent_files(10, true),
                    starter.sections.sessions(5, true),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.indexing("all", { "Builtin actions" }),
                    starter.gen_hook.padding(3, 2),
                },
            })
            require('mini.surround').setup()
            require('mini.tabline').setup()
        end,
    },
}