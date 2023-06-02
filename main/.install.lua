term.clear()
term.setCursorPos(1,1)

os.loadAPI('./yututils.lua')

if disk.isPresent('top') or disk.isPresent('left')
or disk.isPresent('right') or disk.isPresent('bottom')
or disk.isPresent('back') or disk.isPresent('front') then

    files = fs.list('./disk/')

else
    print('Nenhum disco encontrado.')
    print('Pressione qualquer tecla para retornar ao menu')
    os.pullEvent('key')
    shell.run('os/.menu')
    return    
end
    
option = 1

-- print every filename in files

local function listFiles()
    
    term.clear()
    term.setCursorPos(1,1)
    print('Monstrando conteúdo do disco')
    print('Pressione "Enter" para transferir o arquivo selecionado a pasta "Programas"')
    print('Pressione "<-" para voltar ao menu')
    
    print('---------------------------------------')
    if files then
        for i, file in ipairs(files) do
            print((i == option and '-> '..file) or file)
        end
    end
end


-- mainloop

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
                    shell.run('os/.menu')
                    error()
                elseif key == 267 then
                    break
                end
            end
    end
end
    
while true do
    listFiles()
    mainloop()
    if not fs.exists('./os/Programas/'..files[option]) then 
        fs.copy('./disk/'..files[option], './os/Programas/'..files[option])
        term.clear()
        _, y = term.getSize()
        yututils.printCentered(math.floor(y/2), 'Arquivo Transferido!')
        os.pullEvent("key")
    else 
        term.clear()
        _, y = term.getSize()
        yututils.printCentered(math.floor(y/2), 'Arquivo já existente em "Programas"')
        os.pullEvent("key")
    end
end                    