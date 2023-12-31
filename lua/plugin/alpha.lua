return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require "alpha"
      local dashboard = require "alpha.themes.dashboard"
      -- Set header
      dashboard.section.header.val = {

        "",
        "        .&(            &@             /&,",
        "      &&&&(           @@@@@           /&&&@",
        "   ,&&& .&(         @@@@@@@@@         /&, %&&*",
        " .&&    .&(       @@@@@@@@@@@@        /&,    &&,",
        " .&     .&(      @@@@@@@@@@@@@@@      /&,     &,",
        " .&     .&(    @@@@@@@@@@@@@@@@@@@    /&,     &,",
        " .&     .&(  @@@@@@@@@@. @@@@@@@@@@.  /&,     &,",
        " @&     .&( @@@@@@@@@@     @@@@@@@@@@ /&,     &,",
        " &&     &&@@@@@@@@@@        %@@@@@@@@@@&&     &,",
        " &&   &&&@@@@@@@@@@           @@@@@@@@@@@&&   &,",
        " && %&&@@@@@@@@@@               @@@@@@@@@@&&% &,",
        " .&&&@@@@@@@@@@%                 #@@@@@@@@@(&&&,",
        "    &@@@@@@@@@                     &@@@@@@@@@",
        "       @@@@@                        *@@@@@.",
        "         %#                           (&",
        "",
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
      }

      -- # Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  -> Nuevo archivo", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  -> Buscar archivo", ":Telescope find_files<CR>"),
        dashboard.button("h", "  -> Archivos recientes", ":Telescope oldfiles<CR>"),
        dashboard.button("l", "鈴 -> Lazy", ":Lazy<CR>"),
        dashboard.button("m", "  -> Mason", ":Mason<CR>"),
        dashboard.button("c", "  -> Configuraciones", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button("q", "  -> Salir de NVIM", ":qa!<CR>"),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
    end,
  },
}
