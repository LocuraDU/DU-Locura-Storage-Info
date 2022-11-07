local id = itemID
local itemData = system.getItem(id)
itemName = itemData.displayNameWithSize
itemType = itemData.name
itemIcn = itemData.iconPath
itemTier = itemData.tier
