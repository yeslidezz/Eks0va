
-- Advanced Luau Obfuscation (Roblox-Compatible)
local bit32 = bit32  -- Ensure bitwise operations work in Luau
local _dataBlock = "RUVEUWFQbWZaTTxvVkJLPUtWcX91KkNvWC55MVtySktoSh1gQ29GYWZEbEJnYmBkfGN3BHYKVnZibQ1mcwdxdQh3CAglDwQZKhh1HAA7aXkXPCYaGyIAEx4JMmkQMiw0IVUJIjUBGj8jOQkjICEoKzAxOAYATB8+FUQyEwjCt8Ojw4bDrsK8w47CvsOww7rDncOJw7nDgcOCw5zDuMKnw5XDlsO/w5nDmsOyw6DDqsKuw5nDtMO/w5LDqsOow5LClsOhw5HDqcOqw4TDkMKcw7HDrsOAwpTDosOZw5jCh8ODw7HDgsOHw7rDsMOAwozDvcO5w4/Dj8OywonDiMO3wpnChsKrw7zCjsKpwrDDvsKvwonCvsK/woLCi8K4w6TCv8KWwqXDrMKawqbCoMKowr/CmcK2wq/CksKvwqjDlcKpwqHCicKXwqrCocKQw53CrcKpwoLCocKiwr7CmMOFwoPCscKUwpfCusOPwoDDj8KTwrnCkcOEwrLCqcKIxLXFu8WBbjxKKXA/UU5hQUJ0eH9/UXh3WmJgdy5ZdyRSbWgUS2ZSHG5yUEdbaUVhZklYX0txXVd+BUBIQ35OBHZvSDJuATd8DgowfzMOJAEGBTgiZhEiNx4hICo3Hi0/Fm4oEQcmEhcuMhAYJSkbHyZaGAEXMR0HPjgACh8+Eg82SQjDsMOZw4bDq8Onw47DosOww6fDv8OJw73DgcOGw7zDuMOhw53DlsO6w7fDnsO/w6DDqMOBw57Ds8Ovw5bDlcOow4/Dg8Omw4rCnMOuw5HDkMOZw6HDrsOCw4/DpsOFw5jDgMO9w7bDm8OXw77Ds8OAwozDi8O+w5zDj8O2w6fDiMKvw7LCgcKswqfCjsKQwrDCuMKZwo7CpcKBwprClMK3wrHDosKXwqHCt8KCwrjCr8K5wrPCn8Kvwq/CisKYwqfCgcOWwqfCkcKHwrLDkMKfwqTCg8Kswp/DlMK6wrjCl8KSwofCtMKYwpfCosKSwo/Cs8Kpwr/CicKxwqrCtsKHxaLFt8WEaXdSVn9DUUxif1o4d3FBVHx3QmBvQW9cc1FKU2dCQ2dEHHJBX0phbEZheh5XaX13WwxiT09aAXxoeXBveAUPOxZ1dSUhHz4YEg1wcw=="
local _key1 = 41
local _key2 = 3
local _expectedHash = "99458"

-- Tamper Detection
local function verifyIntegrity()
    local function calculateHash(str)
        local sum = 0
        for i = 1, #str do
            sum = sum + string.byte(str, i)
        end
        return tostring(sum % 100000)
    end
    if calculateHash(_dataBlock) ~= _expectedHash then
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
