-- Requires --
local robot = require("robot")
local component = require("component")
local computer = component.computer
local sides = require("sides")

-- You can change this --
local layout = {
   {0, 0, 0,                        -- top layer
    0, 0, 0,
    0, 0, 0},

   {0, 0, 0,                        -- middle layer
    0, 0, 0,
    0, 0, 0},

   {0, 0, 0,                        -- bottom layer
    0, 0, 0,
    0, 0, 0}}

local dropSlot = 1                  -- the slot where the drop item is
local dropCount = 1                 -- how many items should be dropped
local rsSignalSide = sides.front    -- if no redstone signal, use nil
local rsModeHigh = false            -- redstons signal means work
local outputBottomRedstone = true   -- send a rs signal to the bottom
local waitTime = 7.5                -- time between creations
local beeps = true                  -- turn off the beeps

-- Do not change after this --
local dimensions = #layout

local function randomBeep()
    if beeps then
        computer.beep(math.random(400, 2000))
    end
end

local function walk(steps)
    if steps > 0 then
        for _ = 1, steps do
            robot.forward()
        end
    elseif steps < 0 then
        for _ = steps, -1 do
            robot.back()
        end
    end
end

local boolToNum = {[true]=1, [false]=0}

local function isRedstoneSignal(side)
    if side ~= nil then
        if pcall(function () _ = component.redstone end) then
            local redstone = component.redstone
            redstone.setOutput(sides.bottom, boolToNum[outputBottomRedstone])
            return rsModeHigh == (redstone.getInput(side) > 0)
        end
    end
    return true
end

local function getNrItems()
    local itemCounts = {}
    for z = 1, dimensions do
        for i = 1, dimensions^2 do
            local itemNr = layout[z][i]
            if itemNr ~= 0 then
                local ic = itemCounts[itemNr]
                if ic ~= nil then
                    itemCounts[itemNr] = ic+1
                else
                    itemCounts[itemNr] = 1
                end
            end
        end
    end
    local ic = itemCounts[dropSlot]
    if ic ~= nil then
        itemCounts[dropSlot] = ic+dropCount
    else
        itemCounts[dropSlot] = dropCount
    end
    return #itemCounts, itemCounts
end

local nrItems, itemCounts = getNrItems()

local function placeDown(slot)
    if slot == 0 then
        return true
    end
    robot.select(slot)
    return robot.placeDown()
end

local function buildOneLayer(layer, layerNr)
    for i = 1, dimensions^2 do
        if i == math.ceil(dimensions^2/2) and layerNr == 1 then
            robot.select(nrItems+1)
            robot.suckDown()
            randomBeep()
        end
        placeDown(layer[i])
        robot.forward()
        if i % dimensions == 0 and i ~= dimensions^2 then
            if i % (dimensions*2) == 0 then
                robot.turnLeft()
            else
                robot.turnRight()
            end
            robot.forward()
            if i % (dimensions*2) == 0 then
                robot.turnLeft()
            else
                robot.turnRight()
            end
            robot.forward()
        end
    end
    randomBeep()
end

local function buildLayers()
    for i = 1, dimensions do
        robot.turnAround()
        robot.up()
        robot.forward()
        buildOneLayer(layout[i], i)
    end
    randomBeep()
end

local function getItems()
    for i = 1, nrItems do
        robot.turnRight()
        robot.forward()
        robot.turnLeft()
        robot.select(i)
        randomBeep()
        robot.suck(itemCounts[i])
    end
end

function main()
    randomBeep()
    if isRedstoneSignal(rsSignalSide) then
        -- get the items
        robot.back()
        getItems()
        -- go to start position
        robot.turnRight()
        walk(dimensions+1-nrItems)
        robot.turnLeft()
        -- build
        buildLayers()
        -- go to item throw position
        robot.turnRight()
        walk(2)
        while not robot.detectDown() do robot.down() end
        robot.turnRight()
        robot.forward()
        robot.turnRight()
        robot.select(dropSlot)
        randomBeep()
        robot.drop(dropCount)
        -- go back to station
        robot.turnLeft()
        while not robot.detect() do robot.forward() end
        -- deposit items
        robot.select(nrItems+1)
        robot.dropUp()
        randomBeep()
    end
    os.sleep(waitTime)
end

local look_vars = false
while not look_vars do
    main()
end

print("nrItems:", nrItems)
print("itemCounts:")
for i, v in ipairs(itemCounts) do
    print(i, v)
end
