-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local sketch = require("lib/sketch")
local quill = require("lib/quill")
package.path = "/DALL-CC/lib/pngLua/?.lua;" .. package.path
local canvas = require("lib/canvas")

-- User input for risk and personality
local number, magnitude = ...
number = tonumber(number)

-- Input testing for non-number
if type(number) ~= "number" then
    number = 1
end
-- Input testing for out of range
if number < 1 then
    number = 1
elseif number > 10 then
    number = 10
end
-- Magnitude conversion, defaults to large
if magnitude then
    magnitude = string.lower(magnitude)
else
    magnitude = "lg"
end
local size
if magnitude == "sm" then
    size = "256x256"
elseif magnitude == "md" then
    size = "512x512"
elseif magnitude == "lg" then
    size = "1024x1024"
end


-- Printing chosen arguments
print('Number: ' .. number .. ' Size: "' .. size .. '"\n')


-- Read input
term.setTextColour(colours.red)
local prompt = read()
print("\n")
-- Prompt testing
if not prompt then
    error('Error: no prompt provided. Usage: img [number] [magnitude](sm, md, lg)')
end


-- Generate images
local links = sketch.generate(prompt, number, size)


--! USE MAKE DIR FUNCTION
-- Define and make image directory
local dirGen = "/DALL-CC/images/gen/"
local dirOut = "/DALL-CC/images/out/"


fs.delete(dirGen)
fs.delete(dirOut)


fs.makeDir(dirGen)
fs.makeDir(dirOut)


-- Use pngLua to render each in ComputerCraft
for count, url in pairs(links) do
    -- Pull images
    local req = http.get(url, nil, true)
    local png = req.readAll()
    req.close()

    -- Create name and path for gen
    local gen = "gen" .. count .. ".png"
    local out = "out" .. count .. ".bimg"
    local pathGen = dirGen .. gen
    local pathOut = dirOut .. out

    -- Display and save generations
    quill.scribe(pathGen, "wb", png)
    canvas.render(pathGen, 2, pathOut)

    -- Clear and repeat upon any user input
    os.pullEvent("char")
    canvas.clear()
end