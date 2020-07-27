# Tunnel

## [🢀 Back to library](../library.md)

## Materials

slot| item                 | count
:---|:---------------------|-----:
1   | redstone dust        |     9
2   | compact machine wall |     1
3   | hopper               |     1

## Code

```lua
local layout = {
   {1, 1, 1,                        -- top layer
    1, 2, 1,
    1, 1, 1},

   {0, 0, 0,                        -- middle layer
    0, 3, 0,
    0, 0, 0},

   {0, 0, 0,                        -- bottom layer
    0, 0, 0,
    0, 0, 0}}

local dropSlot = 1                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

&copy; 2020 Datennutzung
