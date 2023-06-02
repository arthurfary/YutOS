local function get(file, code)
    if fs.exists(file) then
        fs.delete(file)
    end
    
    shell.run("pastebin get ".. code .." " .. file)
end

if fs.exists('../os/') then
    fs.delete('../os/')
end
fs.makeDir('./os/')
fs.makeDir('./os/Programas')



--

get('startup.lua', 'xVCfrhV9')
get('yututils.lua', 'cddT9hAW')
get('vt.lua', 'UvujEA68')
get('os/.menu', 'V2y6rPp3')
get('os/.install', 'G03iJSF8')
get('os/.programs', 'KxHLJ13E')
get('os/.cmd', 'aFfkyLzj')


sleep(3)
os.reboot()

