-- Import openai and quill
local pathOG = package.path
package.path = "/DALL-CC/?.lua;" .. package.path
local sketch = require("lib/sketch")
local quill = require("lib/quill")
package.path = "/DALL-CC/lib/pngLua/?.lua;" .. pathOG
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
    magnitude = "sm"
end
local size
local factor
if magnitude == "sm" then
    size = "256x256"
    factor = 2
elseif magnitude == "md" or magnitude == "lg" then  -- Medium AND large
    size = "512x512"
    factor = 3
elseif magnitude == "lg" then   --! Large images not rendering, thus temporarily disabled
    size = "1024x1024"
    factor = 4
end


-- Printing chosen arguments
print('Number: ' .. number .. ' Size: "' .. size .. '"\n')


-- Read input
term.setTextColour(colours.red)
local prompt = read()
print("\n")
term.setTextColour(colours.orange)
print("Read\n")
-- Prompt testing
if not prompt then
    error('Error: no prompt provided. Usage: img [number] [magnitude](sm, md, lg)')
end


-- Generate images
local links = sketch.generate(prompt, number, size)
term.setTextColour(colours.orange)
print("Generated\n")


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
    -- Pull images only if exist
    local req = http.get(url, nil, true)
    if req then
        local png = req.readAll()
        req.close()
        print("Downloaded\n")

        -- Create name and path for gen
        local gen = "gen" .. count .. ".png"
        local out = "out" .. count .. ".bimg"
        local pathGen = dirGen .. gen
        local pathOut = dirOut .. out

        -- Display and save generations
        quill.scribe(pathGen, "wb", png)
        print("Saved\n")
        canvas.render(pathGen, factor, pathOut)

        -- Clear and repeat upon any user input
        os.pullEvent("char")
        canvas.clear()
        print("Next...\n")
    else
        print("Prompt not accepted")
    end
end

-- Finish
term.clear()