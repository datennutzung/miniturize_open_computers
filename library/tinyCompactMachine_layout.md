# Tiny Compact Machine

## [🢀 Back to library](../library.md)

## Materials

slot| item                 | count
:---|:---------------------|-----:
1   | compact machine wall |    26
2   | ender pearl          |     1

## Code

```lua
local layout = {
    {1, 1, 1,                        -- top layer
     1, 1, 1,
     1, 1, 1},

    {1, 1, 1,                        -- middle layer
     1, 0, 1,
     1, 1, 1},

    {1, 1, 1,                        -- bottom layer
     1, 1, 1,
     1, 1, 1}}

local dropSlot = 2                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

&copy; 2020 Datennutzung
