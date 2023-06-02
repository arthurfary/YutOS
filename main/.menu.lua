-- imports

os.loadAPI('./yututils.lua')

-- os.pullEvent = os.pullEventRaw(

local option = 1

local function drawMenu()
    term.clear()
    term.setCursorPos(1,1)
    term.write("Rodando YOS 1.1")        
end


-- GUI START --

local W,H = term.getSize()

term.clear()

local function drawFrontend()
    yututils.printCentered(math.floor(H/2) - 3, '')
    yututils.printCentered(math.floor(H/2) - 2, 'Menu Inicial')
    yututils.printCentered(math.floor(H/2) - 1, '')
    yututils.printCentered(math.floor(H/2) + 0, ((option == 1 and '-> CMD      ') or 'CMD      '))
    yututils.printCentered(math.floor(H/2) + 1, ((option == 2 and '-> Programas') or 'Programas'))
    yututils.printCentered(math.floor(H/2) + 2, ((option == 3 and '-> Instalar ') or 'Instalar '))
    yututils.printCentered(math.floor(H/2) + 3, ((option == 4 and '-> Desligar ') or 'Desligar '))
end

-- DISPLAY

drawMenu()
drawFrontend()

while true do
    local p, e = os.pullEvent()
    if p == 'key' then
        local key = e
        if key == 87 or key == 265 then
        
            if option > 1 then
                option = option -1
                drawMenu()
                drawFrontend()
            end
        elseif key == 83 or key == 264 then
            if option < 4 then 
                option = option + 1
                drawMenu()
                drawFrontend()
            end
        elseif key == 257 then
            break
        end
    
    end
end

term.clear()

-- HANDLERS --

if option == 1 then
    shell.run('./os/.cmd')
elseif option == 2 then
    shell.run('./os/.programs')
elseif option == 3 then
    shell.run('./os/.install')
else
    os.shutdown()
end
