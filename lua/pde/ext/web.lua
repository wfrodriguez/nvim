return {
    {
        'mattn/emmet-vim',
        -- lazy = false,
        ft = { 'css', 'html', 'html4', 'xhtml', 'haml', 'htmldjango', 'xml', 'xsd' },
        -- event = 'BufEnter *.css,*.html,*.html4,*.xhtml,*.haml,*.twig,*.xml,*.xsd',
        init = function()
            vim.g.user_emmet_leader_key = ','
            vim.g.user_emmet_settings = {
                variables = {lang = 'es'},
                html = {
                  snippets = {
                    html = "<!DOCTYPE html>\n" ..
                            "<html lang=\"${lang}\">\n" ..
                            "\t<head>\n" ..
                            "\t<meta charset=\"${charset}\">\n" ..
                            "\t<title></title>\n" ..
                            "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" ..
                            "</head>\n" ..
                            "\t<body>\n\t${child}\n</body>\n" ..
                            "</html>",
                  },
                },
              }
        end,
    }
}



