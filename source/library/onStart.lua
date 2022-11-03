template = [[
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

WallPaperIMG = loadImage(']]..WallPaper..[[')
catName = string.upper('${Material}')
KLVolume = '${volume}'
LVolume = '${currentVolume}'
percent = '${percent}'
iconImage = loadImage('${pureName}')
color = color

JericoBar=]]..tostring(showJericoBar)..[[

KorKL=]]..tostring(showinKL)..[[

UseWall=]]..tostring(UseWallpaper)..[[

if UseWall then addImage(background,WallPaperIMG,0,0,rx,ry) 
  else setBackgroundColor(]] .. BG_Color .. [[) end

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
    addText(front,small,'v]] .. version .. [[',rx-100,35)
end

if JericoBar == true then 
 renderHeader('Locura Storage Info')
end

addImage(back,iconImage,370,80,250,250)
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