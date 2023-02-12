-- Import openai and quill
local pathOG = package.path
package.path = "/DALL-CC/?.lua;" .. package.path
local sketch = require("lib/sketch")
local quill = require("lib/quill")

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
if magnitude == "sm" then
    size = "256x256"
elseif magnitude == "md" or magnitude == "lg" then  -- Medium AND large
    size = "512x512"
elseif magnitude == "lg" then   --! Large images not rendering, thus temporarily disabled
    size = "1024x1024"
end


-- Printing chosen arguments
print('Number: ' .. number .. ' Size: "' .. size .. '"\n')


-- Read input
term.setTextColour(colours.red)
local prompt = read()
print("\n")
term.setTextColour(colours.orange)
print("Read...\n")
-- Prompt testing
if not prompt then
    error('Error: no prompt provided. Usage: img [number] [magnitude](sm, md, lg)')
end


-- Generate and display images
local links = sketch.generate(prompt, number, size)
sketch.display(links)