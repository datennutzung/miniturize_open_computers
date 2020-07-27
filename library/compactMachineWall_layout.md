# Compact Machine Wall

## [🢀 Back to library](../library.md)

## Materials

slot| item           | count
:---|:---------------|-----:
1   | iron block     |     1
2   | redstone dust  |     1

## Code

```lua
local layout = {
   {0, 0, 0,                        -- top layer
    0, 1, 0,
    0, 0, 0},

   {0, 0, 0,                        -- middle layer
    0, 2, 0,
    0, 0, 0},

   {0, 0, 0,                        -- bottom layer
    0, 0, 0,
    0, 0, 0}}

local dropSlot = 2                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

&copy; 2020 Datennutzung
