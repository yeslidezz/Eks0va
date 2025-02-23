
-- Advanced Luau Obfuscation (Roblox-Compatible)
local _dataBlock = "DQxRLSgKBxwgNCkxJgAhXRlZHjIBPjstAUIsOgpDMy8JDcOiw4LDt8Ogw4vDjsOxw7XDusOKw7jDhsODw73DucK5w7bDlcO+w57Dm8Ocw6HDpcK3w5rDr8Kjw5PDucOpwqnDhsOiw5fDkMOrwpHDkcKTw6TDqsOaw6bDo8Oiw5nCmcOKw7LDg8KLw7/Dn8OBwoPDksO6w4rCg8Ozw7jDicOOwrrCgsKxwqDCi8KswrHDssK+worCo8KowoPCjMK5w7rCssKSwrjCsMKbwqLCocKnwr7CncKpwpbCk8KxwqnCr8KawqLCi8KQwqvChsKRw5DCsMKtwp7Dk8Kjw5zCmcOawobCssKcwr7Cu8KQwoHDgMKswrrClMK2wrPCpcKJw4vFusWCxajFjsWLxbDFscSxxL/FjcW6xLPFg8WoxbnEu8WixZLFv8WwxZ/FmsWhxbjEq8WdxazEo8WXxbfFqcWuxYrFosWMxZDFq8WdxZHFiMWKxa3FmMWmxafFh8WZxZ3Eg8W1xYPFvsW/xZbFgcWYxYLFvcWMxZjFt8WNxYnFjcS2xILErsSOxIvEtcSxxbHEmMSNxLzEqMSHxIbEucS+xaPElcSnxavEn8SUxKHFocSAxJ3Er8S4xJfFqylpFiUTEC8yEQgaLRomJ1oZAF81HEs/AgEFDjoPQzc4CRDDqsOFw6jDjsOLw6HDscO3w4zDjcOhw6jDh8Odw7nDoMOEw5LDocKrw5/DvsOhwqLDosOdw7HDuMOXwqTDqcOww7TDpcOPw5DDr8OHw5HDiMKHw63DhMKTw6fDuMOZw4DCn8Oyw53DgMO/w5rDgcOFw6jDvcOWw4jDt8Onw4nDj8KIwoXCr8O7wpPCjsK+wp7ChMKMwrnCqMKbwoTCtsKDwoTClMKjwqDCg8KEwq7Cm8KAwp/Cs8KWwovCv8Kmwr3Dk8KkwpfCkMKzwoDCnsK+wrDCrMKbwqbCu8KfwpbCtcKewrfCm8KAwqPCnMKOwq7CnsK8wozCmMKrwq3ChsKexYzFhMW0xaDFk8Wgxb7FjMW+xYzFvsWoxZvFj8W2xa3FgMWUxaDEq8WDxKzFrsW1xZTFn8WsxbjFi8WZxabFhcWsxaTFisWQxbPFkMWexYbEm8WsxYPEk8W7xanFlsW1xbzFtMWfxIvFo8SBxY7FlcWCxbzFlsWIxavEjcWGxaXEqsSExKjEsMSTxIzEvsSdxLLEjMSkxKjEm8S6xLbErcW/xJTEvsSgxIPFusSuxLbEjMScxLLElsSLxKsmPSgnDQAzEB4uXywNGDsOFiZDNwM+JwwOPRo/CEMvEAY0w7bDhMOvw6DDk8O9w77DjMOQw4zDpsOow5/DosO2w4TDosOXw6TDoMOHwr7DrsOdw77DnMOxw5bDj8Oew6bDvsOCw6TDi8Ouw7fDp8Oew67DrMOsw4DCk8O/wp3DlsOkw7jDtMOdw4DDp8Oxw47DvsKXw7/DicOIw6/DssOGw7XCrsKHwrTCsMKXwojCvsKdwozCj8KnwqjCn8K0wrbChcOjwpTCpMKgwofCosKuwo3CvsKcwq7CuMKPw6XCpsKUwo7Cp8KOwpDCt8KUwp7CrMKwwq/CgsKmwr/Dm8KWwqTCksK3wpjDi8Knw4HCjsKuwr3Ci8K2wozCusKkwrvDj8WoxYTFjsWkxazFhMWDxa3FvsWKxb/FuMWDxZ3FucW9xZTFlcW1xKvFm8WnxaHEocSvxZrFr8WWxZPFscWpxKvEk8WixZHEm8WrxbTFkcSSxJvFrcWZxYjFo8WMxZnEmcWgxbLFgsW+xbvEhcWBxILFnsW9xZPFmMWzxZ7FicSLxIzEgsSzxLDEi8SwxLHEtsSuxIrEvsSoxIPEg8S5xbjElMSVxLXEoMSfxLnEocWjxK7EmsSpxJbEk8WlKWkKIgkuKwIRU1sqBggjXhlZKDIcEDsMAUMgOh02MxEJSsOqw4XDtsOOw4vDq8OxwrPDgMOKw6DDhsODw6fDucK5w4DDksO1w57Dm8O2w6HCocOQw53Ds8Kjw5PDicOpwqrDuMOiw4nDrsOrw5LDkcKSw4rDqsOEwpPDo8ODw5nCmsOaw7LDmcKLw7vCgMOBw5jDtMO9w4zDtsO3w7PDicONwrrChcKtw7vCj8KNwrHCt8KYwo3CucK4wofCisK5w7jCpsKSwrvDq8KfwqfCocKnwrbCmsKpw6PCl8KfwqnCrsKKwqXClMKAwq/DkMKRwojCjsKqwpjDk8KnwrTCmcOZwpLCssKAwr7Cv8K3woHChcKowr3CjMODwrfCq8KJw4nFusWFxbDFjsWPxY3FscW1xZDFjcWixajFh8W+xbnEusWcxZXFv8WexZ/FpcWhxaXFkMWdxbPEo8WXxazFqcWvxJfFpcWIxa7Fr8WLxZHEksWCxarFmcSTxafFoMWZxZ/FmsWyxYHFkMW7xb/FgcWFxZrFusWIxbbFt8WuxYnFj8WzxIXErMSOxI/EosSxxbPEkMSKxKXFs8SHxKnEucSgxKrElcS+xKDEn8SNxKHEpcSqxJ3EvcWjxJfEviY+CiQQWzdSHj0sLB8mOwMWDTQ0AxAjMg4WLD8RCCs1Bh7DpsOEw7PDoMOTw4DDvsOLw7LDjMO/w4bDm8O3w7bDrcO6w5TDvcOew4PDtMOuw47Cq8Ofw7DDuMOLwq/DpsO9w7DDpMOSwpvDt8OPw57DhsOkw6/DjcOYw7vDv8OWw6TDmsO3w53DgMOjw4HDjsOWw5bDvMOTwoPDq8O8w4bDtcKUwofCtMKwwpPDtcK+wqbDp8KMwqbDs8KbwoTCtsKWwoDCl8Kmwp7Cg8Khwq7CtcOvwp/CscKowovDssKmwoXChsKkwo/CgMKzwqfCnsKuwqDCr8KDwojCu8K1wpbCtsK0wrfCgMK+wqPCpMKOwq3CrMK8wpTCtsKrwpTChsKlxYTFh8WqxbDFk8Wkxb7FncWYxY/FuMWoxZ/FjsW2xYTFpsWXxaHFoMWHxZfFrsWbxLfFn8WuxKPFj8W2xabFk8STxafFkMSbxbfFiMWexa3FksWvxZjFiMW/xbXFlsWkxbzFt8WCxYDFp8SNxY7FvcWaxb/FiMWIxa/Ft8WGxbPErsSHxLHEjsSXxITEvsSOxafEjMSnxIbEn8SMxLbEhMSAxJfEpsSgxIfEnsSuxJ3EqsScxLLElsSPxJsmFTgnCS43Kh49IC8CCD9fFiZfNx9LJwUOOwo/EkMvSgY2w7bDh8Olw7DDl8Kyw77Di8Oiw4/Dp8Oow5/DmcO2w4XDosOUw7jDuMORw4zDgcOvw4nDjMOTw5/DjcO3w5fDpsOTwpw="
local _key1 = 116
local _key2 = 94

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
