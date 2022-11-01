-- Code Edits By CredenceHamby
-- DU: CredenceH
-- https://github.com/locuradu
-- DU-Locura-Storage-Info
-- This was originally a fork from (https://github.com/brendonh).
-- Some aesthetic ideas from (https://github.com/Jericho1060)
Material = "GoldNuggets" --export: (Default: Storage) Ore Name
Volume_Available_KL = "716" --export: (Default: 1433) Available Volume (KL) in Hub or Container
local BG_Color = "15/255,24/255,29/255" --export: (Default: 15/255,24/255,29/255 (DU/UI))
local HideUnit = true --export: Hides the bottom right widget
local showHeaderBar = true --export: Header Bar - true/false
local showinKL = false --export: Show in KL or L
local version = '2.0'
system.print("----------------------------------------")
system.print("DU-Locura-Storage-Info version " .. version)
system.print("GitHub/LocuraDU")
system.print("----------------------------------------")
if HideUnit then unit.hideWidget() end

template = [[
local json = require('dkjson')
local rx,ry = getResolution()
local x,borderSpacing=10,4
local from_side = rx*0.05
local background = createLayer()
local back = createLayer()
local front = createLayer()
setBackgroundColor(]] .. BG_Color .. [[)
local heading=loadFont('Montserrat-Bold',75)
local small=loadFont('Play',14)
local smallBold=loadFont('Play-Bold',18)
local subtext=loadFont('Play', 8)
local large=loadFont('Play', 60)
local kindalarge=loadFont('Play', 100)
local kindasmall=loadFont('Play', 40)
local catName = string.upper('${Material}')
local KLVolume = '${volume}'
local LVolume = '${currentVolume}'
local percent = '${percent}'
local iconImage=loadImage('${pureName}')
local color=color
local headBar=]]..tostring(showHeaderBar)..[[
local KorKL=]]..tostring(showinKL)..[[

function drawDoubleLine(layer,x,y,rx,space)
    addLine(layer,x,y,rx-x,y)
    addLine(layer,x,y+space,rx-x,y+space) 
end 

setDefaultStrokeColor(back,Shape_Line,0,0,0,0.5)
setDefaultShadow(back,Shape_Line,6,0,0,0,0.5)
setDefaultFillColor(front,Shape_BoxRounded,249/255,212/255,123/255,1)
setDefaultFillColor(front,Shape_Text,0,0,0,1)
setDefaultFillColor(front,Shape_Box,0.075,0.125,0.156,1)
setDefaultFillColor(front,Shape_Text,0.710,0.878,0.941,1)

function renderHeader(title)
    local h_factor=12
    local h=35
    addLine(back,0,h+12,rx,h+12)
    addBox(front,0,12,rx,h)
    addText(front,smallBold,title,44,35)
    addText(front,small,'v]] .. version .. [[',rx-150,35)
end

if headBar == true then renderHeader('Locura Storage Info') end

addImage(background,iconImage,360,50,250,250)
addText(front,heading,catName,50,570)
setDefaultStrokeColor(back,Shape_Line,1,1,1,0.5) 
setDefaultStrokeWidth(back,Shape_Line,0.001) 
drawDoubleLine(back,x,380,rx,borderSpacing)
setNextFillColor(front,${color},1)
setNextTextAlign(front,AlignH_Right,AlignV_Baseline)

if KorKL == true then 
addText(front,large,KLVolume,935,570)
else
addText(front,large,LVolume,960,570)
end

setNextFillColor(front,51/255,60/255,74/255,1)
if KorKL == true then 
addText(front,kindasmall,'KL',930,570)
else
addText(front,kindasmall,'L',955,570)
end


setDefaultFillColor(back,Shape_Box,0.075,0.125,0.156,1)
setDefaultFillColor(front,Shape_Box,${color},1)
function renderProgressBar(percent)      
        local w=(rx-2-from_side*2)*('${percent}')/100
        local x=from_side
        local y=400
        local h=75
        addBox(back,x,y,rx-from_side*2,h)
        addBox(front,x+1,y+1,w,h-2)
end
renderProgressBar()
]]

local ores = { 
 Storage="assets.prod.novaquark.com/30036/2d99f857-9095-4dc8-8034-48847111904f.png",  
 Bauxite="assets.prod.novaquark.com/70186/2a660dc9-9af6-4f4b-87d3-bba4defb1964.png",
 Aluminium="assets.prod.novaquark.com/70186/cfdec659-f969-415e-865b-2f45732c0721.png",
 Coal="assets.prod.novaquark.com/70186/edc9f97e-7359-454e-8ba9-8f960037ae9b.png",
 Carbon="assets.prod.novaquark.com/70186/1bbb1cd2-c592-4e73-a21f-459feafea9f1.png",
 Hematite="assets.prod.novaquark.com/70186/4ff8e9b7-5ed8-4b62-9b02-219219081efa.png",
 Iron="assets.prod.novaquark.com/70186/e4a55054-e4e4-4d31-b476-5a5be639cdfe.png",
 Quartz="assets.prod.novaquark.com/70186/a8d1c39e-d3d3-4a75-bce1-348036588108.png",
 Silicon="assets.prod.novaquark.com/33603/f278b764-df68-43c4-a927-5b95d13129f7.png",
 Chromite="assets.prod.novaquark.com/70186/b7357f8d-43ce-4279-a7d3-75fb6fda4fcd.png",
 Chromium="assets.prod.novaquark.com/70186/30f8a263-b1c5-4183-851a-ef2bdedcbd0c.png",
 Limestone="assets.prod.novaquark.com/70186/dc16bf83-bc00-42b3-8f71-1683e8350efb.png",
 Calcium="assets.prod.novaquark.com/33603/f1088f6b-2a8f-4014-9668-841a0e553b6c.png",
 Malachite="assets.prod.novaquark.com/45824/36e5a9ca-c9f6-4e66-b2f4-fe64c9289224.png",
 Copper="assets.prod.novaquark.com/33603/94c19b9e-c692-4517-9213-e903fdf2bf1a.png",
 Natron="assets.prod.novaquark.com/70186/cec7c516-9f70-4b2b-9d60-6f9527ae36a8.png",
 Sodium="assets.prod.novaquark.com/70186/20bdcf7a-57a1-4c7c-9448-d8bfeaa25807.png",
 Acanthite="assets.prod.novaquark.com/70186/e5246f30-14b3-4bf8-bfc1-9bf20a40ed6e.png",
 Silver="assets.prod.novaquark.com/70186/b8e973ac-7b9b-4d67-907d-569f7ea607a7.png",
 Garnierite="assets.prod.novaquark.com/70186/b8a8443d-374d-4df2-b289-bfe69105a962.png",
 Nickel="assets.prod.novaquark.com/70186/0fc41ba8-947c-49ad-925c-fe08802fd189.png";
 Petalite="assets.prod.novaquark.com/70186/3ce3c407-4cfc-4c90-9258-c7af0a5bcf97.png",
 Lithium="assets.prod.novaquark.com/70186/d3ff1b6d-8e4e-4d9a-92ba-471eb41748b3.png",
 Pyrite="assets.prod.novaquark.com/70186/0423117d-8754-470c-873c-9b56bf3b9ae2.png",
 Sulfur="assets.prod.novaquark.com/70186/f7b48d69-05dc-4ab9-8dcd-98db49ea1c4d.png",
 Cobaltite="assets.prod.novaquark.com/70186/a1e3cbd0-c1c1-423d-abea-bf89fbbeb936.png",
 Cobalt="assets.prod.novaquark.com/70186/d19ba950-6d03-4d48-8ccd-53cca2e75670.png",
 Cryolite="assets.prod.novaquark.com/70186/54c5acf2-7c0c-4154-b38c-ffe22d349b80.png",
 Fluorine="assets.prod.novaquark.com/70186/de954433-be17-41d1-bbc6-e869f299af27.png",
 GoldNuggets="assets.prod.novaquark.com/70186/335baaee-7651-4b90-9e5a-290950ed0f5a.png",
 Gold="assets.prod.novaquark.com/70186/93d6fc8a-b279-4888-b771-d8c6c1e5537b.png",
 Kolbeckite="assets.prod.novaquark.com/70186/c4d32953-9bfb-4586-974d-de0a2ea0f954.png",
 Scandium="assets.prod.novaquark.com/70186/cabbf832-0cd8-4c36-b2fd-447b4d59b255.png",
 Columbite="assets.prod.novaquark.com/70186/891cbe02-e34c-4473-9cac-65ba67075e47.png",
 Niobium="assets.prod.novaquark.com/70186/5f88a651-62ad-4a28-985f-b1f8ad8bded4.png",
 Ilmenite="assets.prod.novaquark.com/70186/13f64ee1-4c8d-40bb-9eff-605e6e6e681f.png",
 Titanium="assets.prod.novaquark.com/70186/b59240cd-f161-4939-a634-a8ba5f55e5a6.png",
 Rhodonite="assets.prod.novaquark.com/70186/a2f5af65-de9e-4b49-a752-a47a42eca4e9.png",
 Manganese="assets.prod.novaquark.com/70186/2f1b6ad3-b034-46d4-862d-c5d3fc8281eb.png",
 Thoramine="assets.prod.novaquark.com/70186/d31d5c49-80d1-4d4e-aa87-9e15d161992b.png",
 Trithorium="iconsLib/materialslib/trithorium_pure",
 Vanadinite="assets.prod.novaquark.com/70186/34804219-fcbb-4900-9358-77688ef535fe.png",
 Vanadium="assets.prod.novaquark.com/70186/6bab2dbf-b46a-4ecd-b931-fa9709f721f8.png",
 Hydrogen="assets.prod.novaquark.com/70186/88781b09-fd68-4f5b-a128-376ca6a7457e.png",
 Oxygen="assets.prod.novaquark.com/70186/828ca6c1-2ef0-4845-b5a6-b1a02d206b69.png"}

local config = {}
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
