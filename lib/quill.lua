local quill = {}


-- Write, read, or append to a file
function quill.scribe(path, mode, input)
    local text
    local file = fs.open(path, mode)
    if mode == "r" or mode == "rb" then
        text = file.readAll()
        return text
    elseif mode == "w" or mode == "a" or mode == "wb" then
        file.write(input)
    end
    file.close()
end


-- Insert into a string at provided position
function quill.insert(str1, str2, pos)
    return str1:sub(1,pos) .. str2 .. str1:sub(pos+1)
end


-- Capitalise first letter
function quill.firstUpper(str)
    return (str:gsub("^%l", string.upper))
end


-- Remove trailing spaces
function quill.trailSpace(str)
    return string.gsub(str, '[ \t]+%f[\r\n%z]', '')
end


-- Truncate newlines into spaces
function quill.truncate(str)
    -- Eliminate all newlines and account for double spaces
    str = string.gsub(str, "\n", " ")
    str = string.gsub(str, "  ", " ")
    str = string.gsub(str, '^%s*(.-)%s*$', '%1')
    return str
end


-- End string with ellipsis
function quill.toBeContd(str)
    str = quill.trailSpace(str)
    return str .. "..."
end


return quill