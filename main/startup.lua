-- imports

os.loadAPI('yututils.lua')

-- clear screen and set cursor to 1,1

term.clear()
term.setCursorPos(1,1)

-- print welcome

local _,h = term.getSize()

yututils.printCentered(math.floor(h/2) - 1,'Bem vindo ao YOS')
yututils.printCentered(math.floor(h/2) + 1, 'Inicializando...')

sleep(2)

shell.run('os/.menu')
