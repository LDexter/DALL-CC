-- Check for invalid repository name
local isMain = fs.exists("/DALL-CC-main/")
local isDALL = fs.exists("/DALL-CC/")
if isMain then
    error("Incorrect repository name, please rename DALL-CC-main to simply DALL-CC.")
elseif not isDALL then
    error("Incorrect repository location or name, please ensure DALL-CC is installed on root, as /DALL-CC/.")
end

-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local sketch = require("lib/sketch")
local quill = require("lib/quill")

local prompt = "A small kitten"
local number = 1
local size = "256x256"


-- Generate image
local link = sketch.generate(prompt, number, size)
print(link)