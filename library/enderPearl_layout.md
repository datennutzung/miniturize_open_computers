# Ender Pearl

## [🢀 Back to library](../library.md)

## Materials

slot| item           | count
:---|:---------------|-----:
1   | obsidian       |    26
2   | redstone block |     1
3   | redstone dust  |     1

## Code

```lua
local layout = {
    {1, 1, 1,                        -- top layer
     1, 1, 1,
     1, 1, 1},

    {1, 1, 1,                        -- middle layer
     1, 2, 1,
     1, 1, 1},

    {1, 1, 1,                        -- bottom layer
     1, 1, 1,
     1, 1, 1}}

local dropSlot = 3                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
```

&copy; 2020 Datennutzung
