term.clear()
term.setCursorPos(1,1)

os.loadAPI('./yututils.lua')

files = fs.list('os/Programas')

option = 1

-- print every filename in files

local function listFiles()
    
    term.clear()
    term.setCursorPos(1,1)
    print('Pressione "<-" para retornar ao menu')
    if yututils.diskPresence() then
        print('Pressione "->" para copiar para o disco')
    end
    print('---------------------------------------')
    if files then
        for i, file in ipairs(files) do
            print((i == option and '-> '..file) or file)
        end
    end
end


-- mainloop
X, Y = term.getSize()

local function mainloop()
    while true do
        local e, p = os.pullEvent()
            if e == 'key' then
                local key = p
                
                if key == 264 then
            
                    if option > 1 then 
                        option = option - 1
                        listFiles()
                    end
                elseif key == 265 then
                    if option < #files then
                        option = option + 1
                        listFiles()
                    end
                elseif key ==263 then
                    shell.run('./os/.menu')
                    error()
                elseif key == 262 and yututils.diskPresence() then
                    if not fs.exists('./disk/'..files[option]) then
                        term.clear()
                        fs.copy('../os/Programas/'..files[option], './disk/'..files[option])
                        yututils.printCentered(math.floor(Y/2), 'Arquivo Transferido ao Disco')
                        os.pullEvent('key')
                    else
                        term.clear()
                        yututils.printCentered(math.floor(Y/2), 'Arquivo já existe em disco')
                        os.pullEvent('key')
                    
                    end
                    listFiles()    
                elseif key == 267 then
                    break
                end
            end
    end
end
--end
    
while true do
    listFiles()
    mainloop()
    shell.run('./os/Programas/'..files[option])
    print('Pressione qualquer tecla para continuar...')
    os.pullEvent("key")
end                    
