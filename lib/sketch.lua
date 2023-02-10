local sketch = {}

-- Import openai and quill
package.path = "/DALL-CC/?.lua;" .. package.path
local openai = require("lib/openai-lua/openai")
local quill = require("lib/quill")


-- Generates image with DALL-E using prompt, number, and size
function sketch.generate(prompt, number, size)
    local gen = openai.generate(prompt, number, size)
    local links = {}

    -- Error image if failed
    if not gen then
        gen = quill.scribe("/DALL-CC/data/empty.json", "r")
    end

    -- Write to gen.json and clear out.txt
    quill.scribe("/DALL-CC/data/gen.json", "w", gen)
    quill.scribe("/DALL-CC/data/out.txt", "w", "")

    -- Append out with each link
    for count, image in pairs(textutils.unserialiseJSON(gen)["data"]) do
        links[count] = image["url"]
        quill.scribe("/DALL-CC/data/out.txt", "a", links[count] .. "\n")
    end

    -- Return last link
    return links
end


return sketch