# Maximum Compact Machine

## [🢀 Back to library](../library.md)

## Materials

slot| item                   | count
:---|:-----------------------|-----:
1   | compact machine wall   |    20
2   | glitched giant machine |     6
3   | machine casing         |     1
4   | ender pearl            |     1

## Code

```lua
local layout = {
    {1, 1, 1,                        -- top layer
     1, 2, 1,
     1, 1, 1},

    {1, 2, 1,                        -- middle layer
     2, 3, 2,
     1, 2, 1},

    {1, 1, 1,                        -- bottom layer
     1, 2, 1,
     1, 1, 1}}

local dropSlot = 4                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

&copy; 2020 Datennutzung
