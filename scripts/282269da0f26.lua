
-- Advanced Luau Obfuscation (Roblox-Compatible)
local bit32 = bit32  -- Ensure bitwise operations work in Luau
local _dataBlock = "BQo5Ey0cNgo5DVNYL1wAFCEfGDkxLiYxGy1LGChOR8OBw4LDh8OWw67Dk8Ouw7TDo8OBw4zDoMOEw4LDtMOCwqPDlsOlwqLDncOcw4XCp8Osw4vCq8OSwq3DnMO1w7jDusOiw7PDpsOWw7HDj8Ojw6zDg8Onw6DCn8Oaw5zDq8O0w4LCisO8w5fDgsOHw7PDvMOXw7fDtMOPw4rDj8O7woTCscKhwozCisKywrTCqcKMwrvCucKEw7/CusK8w7zClMK8wrHCnMKcwqLDosKlwpzCrcOiwpTCsMKqw6rCscKjwpHCgcKowo/CksOQwpXCrMKcwpnCpMKWwprCnMOYwrPCg8KBwrzCksKCw4LCp8K8wozCicK0wo3CisKRw4zFhMW1xLrFjMWoxbLFqcWxxYzFrsWHxYTFncW6xb7Fm8WTxb/FocWYxbXFosShxbHFnMWqxKLFlMWPxarFrsSoxaTFlMSaxajFh8WSxYnFr8WsxYLEksWgxa3FmsWexafFtMWExZHFvMWexYLFmcWdxbzFksWJxbTFpcWKxIjFr8SExLDFusSMxK3EssS2xJPEjMSnxKnEhMSYxLrEvsSfxJPEuMShxJjFocSixaDFpMSbxKnEqcSQxK7EqsSuxbDEowtaLFUSURErAScgQxocCTMBPzhGAkAZOwsZMEgKEVDDg8OmwrrDiMOlw7LCscODw4vDusOHw4DCusO6w6HDocOTw7/DscOYw7bDosO5w4fDm8Oyw7nDlMOuw6rCqMOTw6PDiMKaw6zDl8OSwpHDq8Orw5rDmcOgw7vDmsKbw6vDs8OCw5HDuMOHw4LCgsOzw7vDnsOJw7DDicOKwovDq8KDwqzCocKIw6/CssOzwoPCi8K9wrnCgMKWwrrCvMKLwpPCoMKxwpzCl8KiwqfDuMKbwqjCl8KQwr/CqsKxw7DCo8KNwpHCqMKGwpLDk8KNwqvChMKZwqDCpsKawp/Co8KzwoLCkcK4w4TCgsODwo3Cu8KUwonCsMK6woXCpMOIxYbFqsS6xZTFksW9xaTEqMWOxafFqcWcxbbFtcWCxb3FlsWnxKrFhMW4xa3FmsWPxZ7FsMW5xYzFncWlxZXFrcWmxYnFr8W0xJfFncW8xYXFrsWdxafFvMSYxZXFpcSAxbbFmsWBxaTFvMWNxa/EgMW+xZHFicWsxYvFhcWnxbPEhsSwxLHEkMSrxL3EisShxI7Ev8S5xJzEvsS1xJTFuMSWxKXFqsSExJrErcSfxJvEnsSsxaLEjMSMxKXEvMWsxKYGATQvHS9QLhhSPC0VJz82HD8gEQ08FT4NQiwmBR9Iw4bDrsK6w5DDhsO9w4zDqcOOw6bDqcOcw6jDtcOEwrjDlsOjw7HDgMOYw63Dt8Ofw57DtMOXw4zDnsOlw5TDscOmw4jDgcO0w5TDncOvw6/DrcOCw5nDuMODw5XDj8OFw7XDlsOBw6DDrMONw5TDmcO9w5XDicOow5vDhcOyw6vChcKvwo/CkMKgwqHCv8OzwqTCjMKCwqTDtcKGwqTCisO/wpXCkMKgwpvCtMKXw6PDpQ=="
local _key1 = 75
local _key2 = 97

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

-- Decryption Function (Using bit32.bxor for Luau)
local function decrypt(str, key)
    local decoded = ""
    for i = 1, #str do
        decoded = decoded .. string.char(bit32.bxor(string.byte(str, i), key + (i % 256)))
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

-- Execute Decrypted Script (Compatible with Luau & Roblox)
local decrypted = decrypt(decrypt(reverse(clean(_dataBlock)), _key2), _key1)
local scriptFunc = load(decodeBase64(decrypted))
if scriptFunc then scriptFunc() end
