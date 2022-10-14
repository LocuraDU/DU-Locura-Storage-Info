:heavy_exclamation_mark: | As of release 1.0 HTML on screens and signs is off by default. You will need to enter settings and enable them. Code is being updated.
:---: | :---

# Information
Display for T1-T5 ores, minerals, general storage, and gasses. Will show the icon of selected element.

[![](https://img.shields.io/badge/DU-1.0.6-green?style=for-the-badge&logo=steam)](https://store.steampowered.com/app/2000270/Dual_Universe/)
[![](https://img.shields.io/badge/Maintained-YES-green?style=for-the-badge)](#)
[![](https://img.shields.io/badge/VERSION-v1.1-green?style=for-the-badge)](#)
---
[![](https://img.shields.io/github/issues/locuradu/DU-Locura-Storage-Info?style=flat-square&label=ISSUES)](#)
[![](https://img.shields.io/github/issues-closed/locuradu/DU-Locura-Storage-Info?style=flat-square&label=ISSUES)](#)
[![](https://img.shields.io/github/watchers/locuradu/DU-Locura-Storage-Info?style=flat-square&label=WATCHERS)](#)
[![](https://img.shields.io/github/stars/locuradu/DU-Locura-Storage-Info?style=flat-square&label=STARS)](#)
[![](https://img.shields.io/github/forks/locuradu/DU-Locura-Storage-Info?style=flat-square&label=FORKS)](#)
[![](https://img.shields.io/github/commit-activity/m/locuradu/DU-Locura-Storage-Info?style=flat-square&label=COMMIT%20ACTIVITY)](#)
[![](https://img.shields.io/github/discussions/locuradu/DU-Locura-Storage-Info?label=DISCUSSIONS&style=flat-square)](#)
[![](https://img.shields.io/github/last-commit/locuradu/DU-Locura-Storage-Info?label=LAST%20COMMIT&style=flat-square)](#)
[![](https://img.shields.io/github/contributors/locuradu/DU-Locura-Storage-Info?label=CONTRIBUTORS&style=flat-square)](#)
[![](https://img.shields.io/github/releases/locuradu/DU-Locura-Storage-Info?label=RELEASES&style=flat-square)](#)

# Preview
![Image of Screen](DU-Basic-Storage-Capacity.png?raw=true)
![Image of Screen](DU-Basic-Storage-Capacity-Ore.png?raw=true)

# Install
- Link Programming Board to Screen/Sign, Hub or Container (link order not important).
- Copy contents of "config.json" and right click on programming board > Advanced > Paste Lua configuration from clipboard.
- Edit Lua Parameters: Set Material Name,  Container Size in KL, and Background Color in Hex value without the "#".
- Turn on Screen & Activate Board.

> **Warning**
> This may or may not work with some screens or signs. Please check list below.

# Optional
- Link relay to programming boards then link pressure tile or detector to relay (forces update when standing on pressure tile)

# Current Parameter Options
- Material ( See "Item Compatibility" )
- Volume Available in kL
- BG Color

# Item Compatibility
- :green_square: Storage (Shows Container Icon For General Use)
- :green_square: Bauxite
- :green_square: Aluminium
- :green_square: Coal
- :green_square: Carbon
- :green_square: Hematite
- :green_square: Iron
- :green_square: Quartz
- :green_square: Silicon
- :green_square: Chromite
- :green_square: Chromium
- :green_square: Limestone
- :green_square: Calcium
- :green_square: Malachite
- :green_square: Copper
- :green_square: Natron
- :green_square: Sodium
- :green_square: Acanthite
- :green_square: Silver
- :green_square: Garnierite
- :green_square: Nickel
- :green_square: Petalite
- :green_square: Lithium
- :green_square: Pyrite
- :green_square: Sulfur
- :green_square: Cobaltite
- :green_square: Cobalt
- :green_square: Cryolite
- :green_square: Fluorine
- :green_square: GoldNuggets
- :green_square: Gold
- :green_square: Kolbeckite
- :green_square: Scandium
- :green_square: Columbite
- :green_square: Niobium
- :green_square: Ilmenite
- :green_square: Titanium
- :green_square: Rhodonite
- :green_square: Manganese
- :green_square: Thoramine
- :green_square: Trithorium
- :green_square: Vanadinite
- :green_square: Vanadium
- :green_square: Hydrogen
- :green_square: Oxygen

# Screen And Sign Compatibility
:blue_square: Not Tested :green_square: Working :yellow_square: Partially Works Without Edits :red_square: Not Working Without Edits
> **Note**
> Please post in Discussions if you can confirm a screen or sign.
- :green_square: Screens
- :green_square: Modern Screens
- :green_square: Transparent Screens
- :green_square: Modern Transparent Screens
- :blue_square: Signs
- :blue_square: Vertical Signs

# Ways To Help
- Contribute new code, or updating whats already here
- Donate for Dr Pepper funds at Venmo @terranbytes
- Join or start a discussion on the discussions tab

# In Game
- CredenceH (Dual Universe)
- Locura (Dual Universe)
- NoobTheory (Dual Universe)

# Other
> **Note**
> - This was originally a fork from (https://github.com/brendonh).
> - Some aesthetic ideas from (https://github.com/Jericho1060)

> **Warning**
> Too many screen in an area will hurt game performance. The game will also start throttling back screen quality upon reaching a certain number of screens. Using Animations in screens will make this much worse. Only use a few animated screens in an area for best performance.
