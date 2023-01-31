local sketch = {}

-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local quill = require("quill")



-- Generates image with DALL-E using prompt, number, and size
function sketch.generate(prompt, number, size)
    local gen = openai.generate(prompt, number, size)
    local link

    -- Error image if failed
    if not gen then
        gen = quill.scribe("/DALL-CC/empty.json", "r")
    end

    -- Write to gen.json and clear out.txt
    quill.scribe("/DALL-CC/gen.json", "w", gen)
    quill.scribe("/DALL-CC/out.txt", "w", "")

    -- Append out with each link
    for i = 1, number do
        link = textutils.unserialiseJSON(gen)["data"][i]["url"]
        quill.scribe("/DALL-CC/out.txt", "a", link .. "\n")
    end

    -- Return last link
    return link
end


return sketch