augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter ",FileType scala,java
        \ highlight CollumnLimit ctermbg=DarkGreen guibg=DarkGreen
  let collumnLimit = 79 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType scala,java
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

colorscheme flattown
