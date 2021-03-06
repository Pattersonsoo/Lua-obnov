script_name('Autoupdate script') -- ???????? ???????
script_author('FORMYS') -- ????? ???????
script_description('Autoupdate') -- ???????? ???????

require "lib.moonloader" -- ??????????? ??????????
local dlstatus = require('moonloader').download_status
local inicfg = require 'inicfg'
local keys = require "vkeys"
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

update_state = false

local script_vers = 2
local script_vers_text = "1.02"

local update_url = "https://raw.githubusercontent.com/Pattersonsoo/Lua-obnov/main/update.ini" -- ??? ???? ???? ??????
local update_path = getWorkingDirectory() .. "/update.ini" -- ? ??? ???? ??????

local script_url = "https://github.com/Pattersonsoo/Lua-obnov/blob/main/anti.luac?raw=true" -- ??? ???? ??????
local script_path = thisScript().path

function main()    
    downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            updateIni = inicfg.load(nil, update_path)
            if tonumber(updateIni.info.vers) > script_vers then
                sampAddChatMessage("???? ??????????! ??????: " .. updateIni.info.vers_text, -1)
                update_state = true
            end
            os.remove(update_path)
        end
    end)
 
        if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage("?????? ??????? ????????!", -1)
                    thisScript():reload()
                end
            end)
            break
        end

	while true do
	wait(0)
        if isKeyDown(0x72) and not sampIsChatInputActive() and not sampIsDialogActive() then
            sampSendChat('/ot')
			sampSendChat('/ot')
			sampSendChat('/ot')
        end
    end
end
