syn match   pythonFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars

syn region pythonVars start="(" end=")" contained contains=pythonParameters transparent keepend
syn match pythonParameters "[^,()]*" contained skipwhite

hi def link pythonParameters       Type
