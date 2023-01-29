-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local sketch = require("sketch")
local quill = require("quill")

local prompt = "A small kitten"
local number = 1
local size = "256x256"


-- Generate image
local link = sketch.generate(prompt, number, size)
print(link)