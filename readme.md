# Miniturization Automatisation with Robot Assistance (MARA)

## Table of Contents

- [**Basic Start**](#basic-start)
  - [How to build your robot](#how-to-build-your-robot)
  - [First steps](#first-steps)
- [**The Inventory System**](#the-inventory-system)
  - [How does the inventory system work?](#how-does-the-inventory-system-work)
  - [How to set up your space](#how-to-set-up-your-space)
- [**Configuration**](#configuration)
  - [layout](#layout)
  - [drop](#drop)
  - [redstone](#redstone)
  - [miscellaneous](#miscellaneous)

### Visit the [Layout Library](./library.md)

## Basic Start

### **How to build your robot**

#### You will need (at least)

- An `Electronic Assembler` supplied with power
- An `OpenOS (Operating System)` floppy disk

##### Gadgets

- `Screen (Tier 1)`
- `Keyboard`
- `Inventory Upgrade`
- `Disk Drive`

##### Components

- `Graphics Card (Tier 1)`
- `Redstone Card (Tier 1)`
  - only if you want to use redstone capabilities
- `Central Processing Unit (Tier 1)`
- **2** &times; `Memory (Tier 1)`
- `EEPROM (Lua BIOS)`
- `Hard Disk Drive (Tier 1) (1 MB)`

#### Assemble

Insert all of that into a `Computer Case (Tier 2)`  
(or a `Computer Case (Tier 1)` if you don't want the `Redstone Card (Tier 1)`)

- Click on the green triangle button labeled `Assemble`

![Description below!][assembler_interface]  
_Interface of the Electronic Assembler_

### **First steps**

0. Insert the floppy disk with OpenOS and type `install`
    - follow the instructions on the screen
1. Copy the lua code for [MARA]
2. Create a file on your robot
    - `edit mara`
3. Press <kbd>Insert</kbd> to insert the copied text into your robot
4. Press <kbd>Ctrl</kbd>+<kbd>S</kbd> to save the file
5. Press <kbd>Ctrl</kbd>+<kbd>W</kbd> to exit the file
6. If you get stuck, just delete the file and copy it again
    - `rm mara`

You have now successfully installed MARA on your robot! :tada:

## The Inventory System

### **How does the inventory system work?**

On the right, next to the robot, you place as many inventories (chests, caches, ...) as you have different items in your [miniturization recipe](#layout). The robot will suck as many items as it needs from each inventory into the corresponding slot and will then start to build.  
**Important:** The robot will suck items from the start of the inventory first, so always have the correct item in the first used slot.

When configuring a recipe, the slot numbers are equal to the inventory numbers.

### **How to set up your space**

![Description below!][miniturizer_setup]  
_Overview of the layout of the miniturization setup_

#### **Legend**

- **orange**
  - place any block here, as a stop for the robot. I suggest placing the redstone controls here
- **green**
  - you are free to build whatever you want
- **yellow**
  - do **not** build here, as this will stop the miniturization field from working
- **red**
  - do **not** build **or stand** here. Doing so can cause the robot to run into you and cause the program to break
- **blue**
  - do **not** build **or stand** here, this is the miniturization field and working area of the robot. Doing so can cause the robot to run into you and cause the program to break
- **blue arrow**
  - These are the Miniturization Field Projectors. Place these 1 block above ground level.
- **dark gray cache**
  - an inventory setup according to the [inventory system](#how-does-the-inventory-system-work)
  - you can place an unlimited (except for space) number of caches
- **light gray robot**
  - place the [robot](#how-to-build-your-robot) next to the first cache facing towards the **orange** block
  - above the robot, place another cache as an output for the craft, the created item will be sucked up in the next round
    - if you use something like a vacuum hopper, you can just leave the cache

## Configuration

### **layout**

```lua
local layout = {
   {0, 0, 0,                        -- bottom layer
    0, 0, 0,
    0, 0, 0},

   {0, 0, 0,                        -- middle layer
    0, 0, 0,
    0, 0, 0},

   {0, 0, 0,                        -- top layer
    0, 0, 0,
    0, 0, 0}}
```

The most important part of the configuration, this is where
you will specify how your Multiblock will be built.

The numbers stand for the inventory slot that will be placed
down, `0` means that there should be air.

_When creating a layout, keep in mind that robots cant't place blocks
in thin air without an angel upgrade._

### **drop**

```lua
local dropSlot = 1                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

Miniturization Field Recepies require an item to be dropped into the
field in order to start the miniturization.

These variables are used to specify which and how many items should be
dropped from the inventory slot.

### **redstone**

```lua
local rsSignalSide = sides.front    -- if no rs signal, use nil
local rsModeHigh = false            -- rs signal means work
local outputBottomRedstone = true   -- send a rs signal to the bottom
```

The redstone controls require a `Redstone Card` to be installed.
No installed card means no access to the redstone controls.

This enables you to stop the creation of items by applying a redstone signal.

- `rsSignalSide` is the side where the work signal is being read,
  - if you don't want to use the work signal, set this to nil
- `rsModeHigh` means no signal ⇒ no work, inverted mode
- `outputBottomRedstone` sends a redstone signal to the bottom of the robot
  - use this if there is a hopper in your recipe so that it
    can't steal your items

### **miscellaneous**

```lua
local waitTime = 7.5                -- time between creations
local beeps = true                  -- turn off the beeps
```

Some miscellaneous configs

- `waitTime` is the time the robot waits at home to charge and before it tries to craft a new recipe.
  - if you use redstone control, this is the time it will wait before checking the redstone signal again
- `beeps` controls wheter or not the robot should beep
  - this is very important for **_immersion_** reasons

[Go back up](#table-of-contents "Go up")  
&copy; 2020 Datennutzung, created for [Open Computers v1.7.5.192][oc]

[oc]: https://ocdoc.cil.li/ "OpenComputers"
[MARA]: ./miniturize.lua "go to file"
[assembler_interface]: ./images/el_assembler_interface.png "Electronic Assembler Interface"
[miniturizer_setup]: ./images/miniturizer_setup.png "Miniturizer Setup"
