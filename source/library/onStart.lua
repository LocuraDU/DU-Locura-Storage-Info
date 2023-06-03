template = [[
-- DU-Locura-Storage-Info screen output
json = require('dkjson')
rx,ry = getResolution()
x,borderSpacing=10,4
from_side = rx*0.05

background = createLayer()
back = createLayer()
front = createLayer()

heading=loadFont('Montserrat-Bold',75)
small=loadFont('Play',14)
smallBold=loadFont('Play-Bold',18)
subtext=loadFont('Play', 8)
large=loadFont('Play', 60)
kindalarge=loadFont('Play', 100)
kindasmall=loadFont('Play', 40)

catName = string.upper('${Material}')
BGColor = '${BG_Color}'
KLVolume = '${volume}'
LVolume = '${currentVolume}'
percent = '${percent}'
iconImage = loadImage('${itemIcn}')
counting = '${COUNT}'
totalValue = ${COUNT}*'${value}'
maxitems = '${MAX}'

JericoBar=]]..tostring(showJericoBar)..[[

KorKL=]]..tostring(showinKL)..[[

UseWall=]]..tostring(UseWallpaper)..[[

showValue=]]..tostring(showValue)..[[

HideGitHub=]]..tostring(HideGitHub)..[[

HideTier=]]..tostring(HideTier)..[[

showCount=]]..tostring(showCount)..[[

showTotal=]]..tostring(showTotal)..[[

WallPaperIMG = loadImage(']]..WallPaper..[[')

if UseWall then addImage(background,WallPaperIMG,0,0,rx,ry) 
    else setBackgroundColor( ${BGColor} ) end

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
    addText(front,small,'Locura Storage Info v]] .. version .. [[',rx-170,35)
end

if JericoBar == true then 
  if HideTier == false then 
    renderHeader(string.upper('T${itemTier} ${itemName}'))
else
    renderHeader(string.upper('${itemName}'))
  end 
end

if showValue == true then
    addImage(back,iconImage,120,80,250,250) 
    setNextTextAlign(back,AlignH_Right,AlignV_Baseline)
    addText(back,heading,totalValue,870,230)
    setNextFillColor(back,51/255,60/255,74/255,1)
    addText(back,kindasmall,'ħ',870,230)
    setNextFillColor(back,51/255,60/255,74/255,1)
    addText(back,kindasmall,'EST VALUE',660,170)
elseif showCount == true then
    addImage(back,iconImage,120,80,250,250) 
    setNextTextAlign(back,AlignH_Right,AlignV_Baseline)
    addText(back,heading,counting,870,230)
    setNextFillColor(back,51/255,60/255,74/255,1)
    addText(back,kindasmall,'ITEMS LEFT',660,170)
    setNextFillColor(back,51/255,60/255,74/255,1)
    setNextTextAlign(back,AlignH_Right,AlignV_Baseline)
    addText(back,small,'- of ' ..maxitems,870,245)
else
    addImage(back,iconImage,370,80,250,250)
end

addText(front,heading,catName,50,570)
setDefaultStrokeColor(back,Shape_Line,1,1,1,0.5) 
setDefaultStrokeWidth(back,Shape_Line,0.001) 
setNextFillColor(front,1,1,1,0.5)

if HideGitHub == true then 
    drawDoubleLine(back,x,380,rx,borderSpacing)
else
    drawDoubleLine(back,x,380,950,borderSpacing)
    addText(front,subtext,'GITHUB/LOCURADU',945,385)
end

setNextFillColor(front,${color},1)
setNextTextAlign(front,AlignH_Right,AlignV_Baseline)

if KorKL == true then 
  if showTotal == true then 
    addText(front,large,KLVolume.."/"..math.floor(${maxVolume}/1000),935,570)
  else   
    addText(front,large,KLVolume,935,570)
  end  
else
  if showTotal == true then
    addText(front,large,LVolume.."/${maxVolume}",960,570)
  else
    addText(front,large,LVolume,960,570)
  end
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
