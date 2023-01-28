-- Import openai and quill
package.path = "/DavinCC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local quill = require("quill")

-- Generate image with DALL-E
local gen = openai.generate("real life monster energy can at night", 1, "1024x1024")
quill.scribe("/DavinCC/cmpl.json", "w", gen)