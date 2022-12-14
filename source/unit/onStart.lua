-- DU-Locura-Storage-Info
-- GitHub/LocuraDU For Information / Updates / Downloads 
-- Script Credits: GitHub/CredenceHamby & Discord/Arcto Lupus
-- Other Credits: GitHub/Jericho1060 & GitHub/brendonh
-- Built using the wonderful tools at https://du-lua.dev/
-- Love With Your Heart, Use Your Head For Everything Else - Captain Disillusion

system.print("----------------------------------------")
system.print("DU-Locura-Storage-Info version " .. version)
system.print("GitHub/LocuraDU")
system.print("----------------------------------------")

if HideUnit then unit.hideWidget() end

config = {}
function configure(a,b,c,d)
  if checkSlots(a, b) then
      config.screen = a
      config.container = b
      maxVolume = math.floor(b.getMaxVolume())
      currentVolume = math.floor(b.getItemsVolume()) 
      system.print('Storage connected to ' .. d)
      a.activate()
      return true       
  end

  if checkSlots(b, a) then
      config.screen = b  
      config.container = a
      maxVolume = math.floor(a.getMaxVolume())
      currentVolume = math.floor(a.getItemsVolume())
      --system.print('Storage connected ' .. c)  
      b.activate()
      nameGroup = c
      return true
  end
    system.print(c..' No Container or Hub dectected')
    --unit.exit() (note: need to fix this at some point/Or remove it)
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

function render(PAIRITEM,PAIRMAT,VAL)
  --local pureName=ores[PAIRMAT] (note: will remove later)
  local thingid=system.getItem(PAIRITEM)
  local currentVolume=currentVolume 
  local volume=math.floor(currentVolume / 1000)
  local percent=currentVolume / maxVolume * 100
  local percentSmall=math.floor(percent) 
  local COUNT=math.ceil(currentVolume / thingid.unitVolume)
  local MAX=math.ceil(maxVolume / thingid.unitVolume)
  --system.print("Total Storage Size Is " ..maxVolume)
  --system.print("You Are Using " ..currentVolume)
  --system.print("Thats Exactly " ..percent.. "%")
  --system.print("Item ID " ..PAIRITEM.. " Loaded")
  --system.print("There are " ..COUNT.. " Remaining")  
  system.print(""..nameGroup.." TOTAL:"..maxVolume.." | USED:"..currentVolume.." | PERC:"..percentSmall.."% | INV:"..COUNT.." ("..PAIRITEM..")")  
local color
    if ReverseRGB == true then 
        if percent > 80 then
        color = "177/255,42/255,42/255"
        elseif percent > 70 then
        color = "255/255,128/255,0/255"      
        elseif percent > 60 then
        color = "249/255,212/255,123/255"
        else
        color = "34/255,177/255,76/255"
       end
    else
    if percent > 80 then
        color = "34/255,177/255,76/255"
    elseif percent > 70 then
        color = "249/255,212/255,123/255"      
    elseif percent > 60 then
        color = "255/255,128/255,0/255"
    else
        color = "177/255,42/255,42/255"
    end
end
  local params = {
      pureName=pureName,
      Material=PAIRMAT,
      volume=volume,
      percent=percent,
      color=color,
      currentVolume=currentVolume,
      maxVolume = maxVolume,
      itemIcn = thingid.iconPath,
      itemName = thingid.displayNameWithSize,
      itemType = thingid.name,
      itemTier = thingid.tier,
      value = VAL,
      COUNT = COUNT,
      MAX = MAX
  }
  config.screen.setRenderScript(interp(template,params))
end

function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

if configure(slot1,slot2,"Slot1","Slot2") then
  render(itemID,Material,Value)
end
if configure(slot3,slot4,"Slot3","Slot4") then
  render(itemID2,Material2,Value2)
end
if configure(slot5,slot6,"Slot5","Slot6") then
  render(itemID3,Material3,Value3)
end
if configure(slot7,slot8,"Slot7","Slot8") then
  render(itemID4,Material4,Value4)
end
if configure(slot9,slot10,"Slot9","Slot10") then
  render(itemID5,Material5,Value5)
end
