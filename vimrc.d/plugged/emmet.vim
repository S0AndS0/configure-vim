
""
" Emmet configurations
let g:user_emmet_install_global = 0
autocmd FileType css,html,liquid,markdown,scss EmmetInstall

""
" Customized from `~/.vim/plugged/emmet-vim/autoload/emmet.vim`
let g:user_emmet_settings = {
\    'html': {
\        'snippets': {
\            'html:5': "<!DOCTYPE html>\n"
\                    ."<html lang=\"${lang}\">\n"
\                    ."\t<head>\n"
\                    ."\t\t<meta charset=\"${charset}\">\n"
\                    ."\t\t<meta name=\"color-scheme\" content=\"light dark\">\n"
\                    ."\t\t<title></title>\n"
\                    ."\t</head>\n"
\                    ."\t<body>\n\t${child}|\t\n\t</body>\n"
\                    ."</html>",
\        },
\    },
\    'liquid': {
\      'extends': 'html',
\    },
\    'markdown': {
\      'extends': 'liquid',
\    },
\    'scss': {
\      'extends': 'css',
\    },
\}
