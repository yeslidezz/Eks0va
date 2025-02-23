
-- Advanced Luau Obfuscation (Roblox-Compatible)
local _dataBlock = "w7fDscOkw4DDqMOIw43DlcO/wr7DsMOIw6XCtcOBw6TDp8Kkwr3DkMOzwq3DmcONw6/Cr8Oew5jDtsKlw5HCtMOXwpTCjcOgw4/CncOpw5PDn8Kfwp3DqMOLw6DDocOZw4fDnsOIw7DDmcOWw7nCj8OPw5bDgMO/w4/DnsO1w5XCt8KwwqzCh8KxwojCjcKEwr/DvsKSwojCocO1woXCg8KnwqPDocKQwr/CtsKdwrrCr8KpwqDCn8Kvwr7ClcKKwpfCk8KQwqDCj8KWwqnCl8KfwobCpsKvwp/CjsKlwqTCh8OHwpDCt8KBwobCvcKiwo/CiMOJwr/CicKewrXDicW3xbDFqMWHxbHFtsWNxYzFv8S/xLnFiMWjxLXFhcWbxafEpMWwxZfFvcW2xZ3FhMWvxavFrMWfxbvFvsWVxLDFl8WOxJHFp8WOxJ3FrcWixZ/FmMSdxajFn8WexaXFpcWHxYHFkMW3xZ/EjcW9xIPFj8WLxZDFv8WRxIXFtcWqxLfErsSWxIDEtsSmxInEgsS/xb3ErMSIxL3EgMSFxJnEp8ShxJ7El8S9xa3EmcSHxK/Eq8SwxJ/EtsWlxJXEhcSXxI7ElMSnxIjElsSxxLDEkMSwxIjErsSexKDEucSBxIjEk8S6xLXEmcSGxKXFmMSAxLXEosS9xJDFhcSpxK7DuMOjw5LDhsOxw4jDkcOmw7DDhcKlw43DuMOuw5nDvMOow5rDmsOWw6LCrcOBw47DoMOAw47DnsOvw67DicOnw5jDg8OMw6bDkcOWw7HDrMOQw7DDosOuw53ClcO5wpnDiMOTw77DtsOCw7jDpcOFw4DDmMOYw73DksOww6nDucK4wpjCsMKGwqzCpsKRwrLCsMKDwqjCjsKlw7XCmcK9wqjCi8OlwpXCpcK2woHCkcKgwoPCksKewrDCrsKJwpDCmMK7wozCpcKPw53CscKOwpDCi8KEwq7ChcKgwrnCt8KIwqvChMK1wobCuMKhw4/CgMKbwq7CvcKbw4XCqcKGxbjFiMWwxYbFqMWIxZHFtsWwxYDEpcWOxaHEtcWZxbvFqMWdxbTFlcWixZjFhcWGxaDFkMWsxZ7FssSlxY3Ft8WYxajEjcWmxZHEncW1xJPFkMWjxJnFrcWYxaDFvcW9xYjFvcWYxbXFgsW4xaXFvsWAxZvEicW+xY3EhcWtxbPEuMSNxbHEhcSyxb3ElcW0xLDEhcSgxI3EvMSuxJ3FvsSoxJrEuMSVxKfEtsSFxIbEoMSTxIrEnsSsxaXEjcWqxJjEqsS2xKXEkMWdxLXEnsSQxKXEiMSuxIPEnsS9xZnEiMS7xL7EtsSCxIbEpcSSxIDEsMSIxL3ElcSexK3EjsO4w4rDisOGw6jCvcOVw6vDsMOAw57DjsO4w77DncK+w6jDm8Oow5XDs8OYw4XDgMOgw5PCqcOew67DrsONwqfDmMOrw6rDpsOQwp3DscOuw5DDpcKZw67Dg8Oew73DlsOIw7jChcO1w5rDhsOhw7/DgMOgwonDvMOPwoXDm8OVwrjDt8OxwoTCtsKIwqPCiMKww7zChsKMwqPCvsKrwqvCqMOkwpbClMKgwpjCs8OhwqDDr8KgwpzCrcK+wrvCmsKYw5fCssKkwpXClsKDwqDCkMKYwrrCo8KHwp7Ci8OcwojDhsOBwrTChsKGwpPCr8KAw43CrsKzwpHCsMKbwrXFuMS2xLHFi8WrxYjFo8WNxbDEvcW4xYzFvMWAxavEtsWoxKXFuMWUxb7FmMW3xY/FoMStxK3FnMW0xb7Fu8WYxZjElcWQxavFicWWxYPFisWQxJ7FosWoxYDFnsWhxJY="
local _key1 = 170
local _key2 = 128

-- Tamper Detection
local function verifyIntegrity()
    local expectedHash = "REPLACE_WITH_HASH"
    local function calculateHash(str)
        local sum = 0
        for i = 1, #str do
            sum = sum + string.byte(str, i)
        end
        return tostring(sum % 100000)
    end
    if calculateHash(_dataBlock) ~= expectedHash then
        error("Integrity check failed. Terminating.")
    end
end
verifyIntegrity()

-- Junk Data Injection
local junkVariables = {}
for i = 1, 300 do
    junkVariables[i] = "DATA_" .. tostring(math.random(100000, 999999))
end

-- Scrambling Cleanup
local function clean(str)
    return str:gsub("[XYZ123!@#$%^&*()-_=+[{]}|;:,<.>/?]", "")
end

-- Reverse Function
local function reverse(str)
    return str:reverse()
end

-- Decryption Function
local function decrypt(str, key)
    local decoded = ""
    for i = 1, #str do
        decoded = decoded .. string.char(string.byte(str, i) ~ (key + i % 256))
    end
    return decoded
end

-- Base64 Decode Function
local function decodeBase64(str)
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

-- Extra Fake Execution Paths
for i = 1, 150 do
    local name = "fakeData_" .. i
    _G[name] = tostring(math.random(1, 100000)) .. "_DUMMY"
end

-- Execute Decrypted Script (Compatible with Luau)
local decrypted = decrypt(decrypt(reverse(clean(_dataBlock)), _key2), _key1)
local scriptFunc = load(decodeBase64(decrypted))
if scriptFunc then scriptFunc() end
