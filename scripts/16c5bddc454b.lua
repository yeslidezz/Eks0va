
-- Advanced Luau Obfuscation (Roblox-Compatible)
local bit32 = bit32  -- Ensure bitwise operations work in Luau
local _dataBlock = "Y3hEDG98FiQYKhYXFSwaCx8heQAYOAoSBBJhZzUwIGsCNRk4OBcmLDALJScnVQBGMikYHggYHEEjMU08Fx9BDTQWEwkyLcK0w6bDicOpw6vDpMOOw6/DicO4w5rCucO/w4zDiMO4w7fDncOIwqDCocOhw5TDsMKswqjDlsO1w7vDiMOQw7fDl8Ozw4DDjsOiw7PDqMOLwpjCnMO8w6jDusO5w7jDusKEw73Ds8Oxw5fDmMO4w6HCgMKIw7nDkMO9w5bDtsOpwrfCssKQw7LCr8KUwpbCrMKjwq/CjsKIwo3CrMKLwrzCm8KlwqXDp8OnwpbCpcK0wpfCgMKtw6/CkMKZwq/CksKrw5fClcOVwrDCocKQwpTCo8KBwp3CmcKgwqnCgcKcwrvCncKFw4fCuMKxwoLCusK3wq7CjcOOwrDCucKTwpzFi8WuxbXEtMWixYbFtsWKxYPEvsW9xLzEu8WJxbvFvMWbxabFpcSmxZDFkcWixbTFl8Wfxa3Er8SvxZnFtsW8xa/FpMWVxJfFvMWhxZfFqsWjxaTFncSdxajFqcWfxJfFv8SGxYXEh8W8xbbFmsWExbPFrk0PeHlZTAsENXUQASEKAxE9O2MJOwIfJCVlPhE4GhMILW4mGTQSLxUVVVchDAQjDx1eDikCHDshBUZDNhwEMxsNFEs+FxzDj8Oxw7XDs8Oqw4bDtMOKw4fCu8O9wrzCo8OOw6nDgsOfwqTDpcOiw6LDlsOxw7TDk8OLw63DqsOMw57Dr8Osw6vDt8OVw4zDhsOmw5DDqsOjw5jDncOZw47DrsOYw4zDu8O6w4XDnMKbw7HDhsOUw7PDsMONw5TCi8O+w4rDssKLwonCtcKswozChsKywqTCh8K+wr3Cu8Ojwo7CpMKCwp/Cn8KlwqHCnMKWwr7CtMKTw6DCrcKrwrrCmcKyw6fCr8KpwpXCjMK8wqbCiMKUwqPDm8KdwoTCoMKuwobCnMK/wrjChcKBwqDCtsKRwoTCt8Kowo3Ci8Kowr7CkMKcxY/Fg8W1xbHFgMWGxajFpMWHxZPFvcW7xZTFjsW8xLfFn8WbxaXFosWExZbFusSvxZfFvcWtxavFtsWexa7FvMWvxYDFlcWSxbzFo8WXxYTFv8WzxZLFssW8xavFhcWixafFkMWKxanFrMWzxZnFlMWrxIBCYQ97UEwTLzoiKgM2ChshMgc6CyEmHig0Om00AgECGw=="
local _key1 = 16
local _key2 = 58
local _expectedHash = "9365"

-- Tamper Detection
local function verifyIntegrity()
    local function calculateHash(str)
        if not str then return "0" end
        local sum = 0
        for i = 1, #str do
            sum = sum + (string.byte(str, i) or 0)
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
    return str and str:gsub("[XYZ123!@#$%^&*()-_=+[{]}|;:,<.>/?]", "") or ""
end

-- Reverse Function
local function reverse(str)
    return str and str:reverse() or ""
end

-- Decryption Function (Using bit32.bxor for Luau)
local function decrypt(str, key)
    if not str or #str == 0 then return "" end
    local decoded = ""
    for i = 1, #str do
        local charByte = string.byte(str, i)
        if charByte then
            decoded = decoded .. string.char(bit32.bxor(charByte, key + (i % 256)))
        end
    end
    return decoded
end

-- Base64 Decode Function
local function decodeBase64(str)
    if not str or #str == 0 then return "" end
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
if decrypted and #decrypted > 0 then
    local decodedScript = decodeBase64(decrypted)
    if decodedScript and #decodedScript > 0 then
        local scriptFunc, loadErr = load(decodedScript)
        if scriptFunc then
            scriptFunc()
        else
            warn("Error loading script: " .. tostring(loadErr))
        end
    else
        warn("Decryption failed: Decoded script is empty")
    end
else
    warn("Decryption failed: Output is empty")
end
