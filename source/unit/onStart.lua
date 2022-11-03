-- DU-Locura-Storage-Info
-- Information / Updates / Downloads: GitHub/LocuraDU 
-- Code: GitHub/LocuraDU & GitHub.com/brendonh
-- Design: GitHub/LocuraDU & GitHub.com/Jericho1060
-- Info: LocuraDU is a mod hub for many games by GitHub/CredenceHamby
-- Love With Your Heart, Use Your Head For Everything Else - Captain Disillusion

system.print("----------------------------------------")
system.print("DU-Locura-Storage-Info version " .. version)
system.print("GitHub/LocuraDU")
system.print("----------------------------------------")
if HideUnit then unit.hideWidget() end

config = {}
function configure()
  if checkSlots(slot1, slot2) then
      config.screen = slot1
      config.container = slot2
      maxVolume = math.floor(slot2.getMaxVolume())
      currentVolume = math.floor(slot2.getItemsVolume())         
      system.print('Storage connected Slot2')
      return true       
  end

  if checkSlots(slot2, slot1) then
      config.screen = slot2  
      config.container = slot1
      maxVolume = math.floor(slot1.getMaxVolume())
      currentVolume = math.floor(slot1.getItemsVolume())
      system.print('Storage connected Slot1')       
      return true
  end
    system.print('No Container or Hub dectected')
    unit.exit()
  return false
end

screens = {}
for slot_name, slot in pairs(unit) do
    if type(slot) == "table"
            and type(slot.export) == "table"
            and slot.getClass
    then
        if
            slot.getClass():lower() == 'screenunit'
            or slot.getClass():lower() == 'screensignunit'
        then
            slot.slotname = slot_name
            table.insert(screens,slot)
        end
    end
end

if #screens == 0 then
    system.print("No Screen Detected")
    unit.exit()
else
    table.sort(screens, function(a,b) return a.slotname < b.slotname end)
    local plural = ""
    if #screens > 1 then plural = "s" end
    system.print(#screens .. " Screen" .. plural .. " Connected")
end

function checkSlots(a, b)
  return (a ~= nil and b ~= nil and
              string.match(a.getClass(), "Screen") and
              string.match(b.getClass(), "Container"))
end
function render()
  local pureName = ores[Material]
  if pureName == nil then
      system.print("Invalid ore name")
      return
  end 
  local currentVolume=currentVolume 
  local volume = math.floor(currentVolume / 1000)
  local percent = volume / maxVolume * 100000
  system.print("Total Storage Size Is " ..maxVolume)
  system.print("You Are Using " ..currentVolume)
  system.print("Thats Exactly " ..percent.. " %")
 local color
  if percent > 80 then
      color = "177/255,42/255,42/255"
  elseif percent > 70 then
      color = "255/255,128/255,0/255"      
  elseif percent > 60 then
      color = "249/255,212/255,123/255"
  else
      color = "34/255,177/255,76/255"
  end
  local params = {
      pureName=pureName,
      Material=Material,
      volume=volume,
      percent=percent,
      color=color,
      currentVolume=currentVolume
  }
  config.screen.setRenderScript(interp(template, params))
end
function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

if configure() then
  render()
end
