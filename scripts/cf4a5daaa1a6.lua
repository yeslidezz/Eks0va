
-- Highly Obfuscated script
local encodedScript = "w7DClcOwwpzDvMKGwqLDvMKmwp7DvsKGwqTDv8KEwpnDv8KZwoPClMO0wqTClMKvwr3ClcKLwprCl8KvwrvDvMKIwqDCl8KpwrrCl8KAw77Cl8KswovClMO0wqTClMKow7vCl8KbworDv8KXwr3Dv8K1w7/Dv8KuwqHCl8Khw77ClcKBwrnDv8O0w7/DvsKUwrjDv8KcwqPClcKvwqHDv8KfwqPClcKvwrvClcKDwqDDvsKuwqHDv8KDwpXCl8KpwqTClMKbwoXDv8Ksw73Dv8Khw7/ClcKXwrjClMKuwpXDv8KUwrTDv8O0wrTClcKBw7vDvMKAwoXDvsKuw73Dv8KfwoXClcKswqTDvMKqwo7ClMKpwqHClcKpwojDvMKuw73DvMKfwoXClcKew7vClcKYwprClMKvwqXDv8KpworClMKGwqPClMO4wprDvMKswrTDvsKfw77DvsKuwqbClMKLw7/DvsKvwr7ClcK9wqrDv8KOwqTCl8KYwqDClMKXwqHDvsKXwqDClcKEwqrClcO9wonClcKEwr/Cl8O0w7/ClcKvwqLDvsKHwprClcKXwpXDv8K9wqrCl8KEwqHCl8KXwprDvsKXwqTClMKMwp7DvMKdwqrCl8KYwprClcKvwqXDvMO4wqDCl8KuwqHDvMKDwpXClcKb"
local xorKey = 205

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
