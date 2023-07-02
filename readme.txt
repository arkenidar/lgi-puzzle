Software usato finora per "lgi-puzzle" un 8-Puzzle in Lua + GTK3:
(GTK per la finestra con i pulsanti cliccabili e Lua per la logica di funzionamento)

Lua (pacchetto Debian "lua") e lgi per usare GTK da Lua (pacchetto Debian "lua-lgi").
ZeroBrane Studio per editing Lua, avvio e debug con "mobdebug.lua"
(ZBS configurato per usare "lua" di sistema).

Glade per disegno visivo di UI e Sublime Text per editing al suo XML (file "*.ui").

git-scm, GitHub, SublimeMerge per repository Git.


Infine menziono pure: Firefox e GSearch per trovare documentazione sull'uso e risposte varie.
E Debian 11 sotto forma di MX-KDE (mxlinux.org).

NOTA: avrei potuto usare wxLua che in Linux usa wxGTK, quindi comunque GTK. Ma credo che wxLua in quanto wxWidgets sia meglio supportato sotto Windows e Mac (e BTW wxLua è ciò che usa ZeroBrane Studio per la sua UI relativamente portabile tra questi 3 sistemi desktop intendo).

----------------------------------------
user.lua (ZeroBrane Studio configuration file)

path.lua=[[c:\msys64\mingw64\bin\luajit.exe]] -- LuaJIT 5.1

-- to specify full path to lua interpreter if you need to use your own version
-----path.lua = '/usr/bin/lua'
-- $ which lua
-- /c/opt/msys/mingw64/bin/lua

path.lua=[[c:\opt\msys\mingw64\bin\lua5.1.exe]] -- Lua 5.1
-- lua5.1 main.lua
-- pacman -Ss lgi
--  pacman -S mingw-w64-x86_64-lua51-lgi # install LGI (GTK for Lua)
-- MSYS 2 / MinGW 64
-- $ cd "C:\opt\Dropbox\main\code\lua\puzzle\lgi-puzzle" && lua5.1 main.lua # app