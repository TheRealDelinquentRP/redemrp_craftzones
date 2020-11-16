# redemrp_craftzones

  
Dependencies
    redem (https://github.com/kanersps/redem)
    redem_roleplay (https://github.com/RedEM-RP/redem_roleplay)
    redemrp_inventory 2.0 (https://github.com/RedEM-RP/redemrp_inventory)
    redm_moonshine_interiors (https://github.com/CryptoGenics/redm_moonshine_interiors)

Object based interaction come from MrLupo and MrBohanon

****THESE MUST BE ADDED TO YOUR INVENTORY config.lua UNDER Config.Items TO WORK****
  ["cauldron"] =
  {
      label = "Cauldron",
      description = "for cooking",
      weight = 5.0,
      canBeDropped = true,
      canBeUsed = true,
      requireLvl = 0,
      limit = 1,
      imgsrc = "items/cauldron.png",
      type = "item_standard",


  },
  ["tent"] =
  {
      label = "Tent",
      description = "for storing things and keeping you dry",
      weight = 7.5,
      canBeDropped = true,
      canBeUsed = true,
      requireLvl = 0,
      limit = 1,
      imgsrc = "items/tent.png",
      type = "item_standard",


  },
  ["grill"] =
  {
      label = "Grill",
      description = "for cooking",
      weight = 5.0,
      canBeDropped = true,
      canBeUsed = true,
      requireLvl = 0,
      limit = 1,
      imgsrc = "items/grill.png",
      type = "item_standard",


  },
  ["spit"] =
  {
      label = "Spit",
      description = "for cooking",
      weight = 5.0,
      canBeDropped = true,
      canBeUsed = true,
      requireLvl = 0,
      limit = 1,
      imgsrc = "items/spit.png",
      type = "item_standard",


  },

Sample crafting recipes

["moonshine"] = {

  items = {
          "empty","sugar","empty",
          "empty","corn","empty",
          "empty","water","empty"
          },
  requireJob = "empty",
  type = "still",
  amount = 5,
              
          
},

["Cooked Pork"] = {

  items = {
          "empty","empty","empty",
          "empty","pork","empty",
          "empty","empty","empty"
          },
  requireJob = "empty",
  type = "cooking",
  amount = 5,
              
          
},

["water"] = {

  items = {
          "empty","empty","empty",
          "empty","dirtywater","empty",
          "empty","empty","empty"
          },
  requireJob = "empty",
  type = "cauldron",
  amount = 5,
              
          
},
