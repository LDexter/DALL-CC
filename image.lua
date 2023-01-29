-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local quill = require("quill")

-- Generate image with DALL-E
local gen = openai.generate("WALL-E", 4, "1024x1024")


-- Error image if failed
if not gen then
    gen = quill.scribe("/DALL-CC/empty.json", "r")
end


-- Write json and link
quill.scribe("/DALL-CC/gen.json", "w", gen)
local link = textutils.unserialiseJSON(gen)["data"][1]["url"]
print(link)
quill.scribe("/DALL-CC/out.txt", "w", link)