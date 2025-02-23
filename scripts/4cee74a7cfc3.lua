
-- Advanced Luau Obfuscation (Roblox-Compatible)
local _dataBlock = "wq/DrcO1wp/CsMOlwpHClcKXwpDCtsKgwpbClsKtw5/Cn8KZwozCr8KAw5XCpcK9wofCgMKYwrDChMK4wr3DhcKPwonCnMK/wpLCjsKpwqnFuMWbxaDFhcWpxYjFkcWfxbDFhcWexY7FvcS1xZnFisWoxZ3FhsWWxafErcWBxaXFoMW4xZLFnsWzxb7FicWUxZjFrcSRxabFlsWGxbHFo8WQxYjFssWuxYPFnsW5xITFiMWoxabFtsWHxZbFocW6xYDFmMW2xb7FjMWwxa3Fl8S4xJjEsMSGxLXEpsSRxITEsMSCxb3EjcSkxL7EmcSsxKjEsMSKxJbEs8WtxIHElMSgxIPEnsSexLXEvsSJxKbEmMSrxLrEpsSIxIbEscSVxJDEo8WdxK3En8WVxLnEjsSIxJPEosS1xIfEhsShxYTEgMSgxKLEvsSVxJ7EqcScx7jHo8egx4bHrcemx5HHlcewx5DGvceNx73HgMeZx6jHqMewx5bHlcekxq3Hgce0x6DHgMegx57HsMalx43HkseYx6jGjcemx4jGncexx4PHkMeix5jHrcedxpXHucacx4jHuMe2x7XHm8eGx6XHn8eAx7XHqse9x4jHnsetx5rGuMaIx7XGhsa3xqbGlcaxxrDGhcakxo7Gp8aAxpnHvMaoxrPHocaVxqbGmMaFxp7CoMKSwqzCncKqwpDCjcKcwpjCgMKEwqbCjsKGwrXDl8KQwojChMKuwovCoMK9wr7CiMK4wojCtsKbwpbCpcOCwoDCtcKywr7Ck8KOwq3ChsW4xY3FrMWFxanFpsWVxYTFsMWAxbjFjcWhxYDFmcWbxajFm8SlxZbFp8StxYXFmcWgxZDFlsWdxbTFkMWNxbLFmMW7xJXFpcWIxYbFtcWNxZDFoMWIxa3FhcWexb3Fi8WIxbjFnMW1xZzFlsWlxaDFgMWwxbLFvcWRxY7FrcWOxLjEjcSKxIXEo8SmxJXEocSwxIPEmsSNxKDEgMSdxb/EqMSdxKjElMSmxKbEs8ScxKDEq8SWxJzEqsS+xLvEjMSYxJPEhMSkxJXElsSDxLHEkMWexYXEo8SAxKDEi8S2xIjFhcSixLTEgMSGxJPEh8SAxY3EnMS8xI3FhcSbxJjHuMa1x5rHhMe1x6bHo8eNx7DGv8eOx4zHv8eAx6vHnseox6DHiseUx6fGrcezx5PHoMaux4LHnMezx77Hu8awx5jGlsemx6THi8eox4PGnseQxpzHrsesx4HGlceLx4DHiMaHx4THtMedx7jHk8e1x4DGjMeAx7PHiseOx5vGica4x7bHtcaExq7Gtsajxr7GsMe8xrjGg8anxoDGq8aYxqjHpcaexpvGpcetxrPGrsKgw67CtMKcwrvCrsK7w6bCmMOWwoDCq8KWw53Cg8KAwpDDnsKQwqPChMKgwovCiMKIw4fCiMK0wp/ChsKTwpzCgMKWw4nCvMKXwrDCn8KoxbjFrsWaxYTFssS9xafFlcWwxbvEvcWMxaHEtcWrxbbFqMWhxZbFm8W7xabFt8WQxaDFq8SpxZPFr8W+xb/FkcWYxZDFqsWkxY7FlsWHxYTFkMWYxabFo8WZxZ7Fj8WMxYjFgcWExbTFhcW4xZfFtMWAxI/FqsWzxY3FnsWfxZvEuMSzxJrEhMSjxIjEp8SIxLDEucWlxIPEucSAxK/EhsSoxL7EoMSbxL3FrcS3xabEoMSoxLjEk8S1xL7Ev8SmxJjEk8SuxKvEisSoxIfEocSQxZzEgMSsxIDEjsSPxZfEiMWExJjEtMSGxLjEl8WPxIDFjMWVxLPEkMSexJ/Epse4x7HGsceAx67HtseNx7fHv8e7x7zHj8eix77Hhca7x6fGpceGx5fHvcemx53Hjsevx7bHrMefx7XHrseVx5rHl8eQx5DHp8eIx5bHrceQx5DHpceIx63HgcaVx7nHmseIx5PHnMe2x4XHuMehx6bHgMe1x7bHvceSx57HrcaHxrjGmMe1xoXGsMe9xpHGgMawxqjGrMaOxrrHtcadx7zGqMadx6XGlsagxpjGgcadwqDCg8Opwp7CrsKQwonCusKYwqrChMKlwpbChsKxwqPCkMKzwqbCrsKcw5XCucKmwojCk8KqwrbChsKGwqHCu8KAwqPCvsK9wpPCjsKpwo7FuMWLxZLFhsWpxabFkcS0xbDFkMWGxY7FoMS1xZnFjMWoxbDFnsWWxbnFpsWBxZnFoMWAxZ7FnsWwxb7FicW8xZjFuMWyxabFiMWGxbHFqMWQxaDFrsWuxYDFoMW5xYXFiMW4xaLFtsWZxYbFocWDxYDFm8Wixb7FksWOxanFlsS4xKDFscSGxKzEiMSRxJ7EsMSrxaXEjsShxIDEncSHxKjEs8SoxJbEosSYxIXEmMSgxLvEnsSexLvFpcSNxJ3EmMSrxKrEpcSSxIbEtcSsxJDEi8WZxK3EmMSexL3Eh8SIxL3EusS2xIfElsSlxLPEgMSbxYnEvcSMxYXErcSFx7jHi8eax4XHt8emx5XHosewx6jHrMeOx6XGtcedx5fHqMebx4LHlcenx7bHhceAx6DHkseWx53Hr8e+x43GqMeYx6jHjMemx4zHlse1x7XHkMejx4THrseZx57HvceZx4jHvceUx7XHmsaNx6XHmMeAx7PHvse9x5vGhcetx5PGuMabxrDGhcaoxrbGlcaMxrDGg8a4xo3GpsaAxpnGl8aoxprGuMaVxr3GpsaFxobCoMKTwqzCncK7wpDCjcK2wpjCuMKEwqXCicOdwrXCs8KQwqDDncKuwpzCnsK9wr3CiMK9wojCtsKbwpbCpcKSwoDCs8KYwr3CkMKewp/DisW4xLTFjsWExbLFpsWjxa/FsMS+xYbFg8Wkxa7Fq8WGxajEp8WgxZvFoMW2xbPFkcWgxK/FksWTxbXEpcW7xZjFmMWTxJXFpMWUxZbFg8WTxZDEnsWYxaPFhcSVxYvFjMWIxIXFhMW0xYfFuMWTxIfFgMSOxInFvMWPxY7Fn8WXxLjFt8SGxIvEo8W9xKPEn8SwxLjEuMSMxKPErsSrxJvEqMWkxLTElMS6xJjEs8SUxKDEqcSWxJPEs8WlxLvFrcSYxZfFkcSrxJHEqMSDxKDEkMWdxKLErMSLxJ7Ei8SdxIjFhsSYxLvEgMSGxJPFjsSAxY3ElMS8xJTFhcSbxLvHuMeux5LHhMeux6bHo8eVx7DGvceGx4zHpse+x6vHqseoxqTHoMebx7vHtsezx7DHoMasx7jHnMe1x77Hu8eGx5jGlMeqx6THg8eGx4PGn8eQx5jHhMejx57GlcePx5fHiMaGx7rHu8eFx7jHl8eUx4DHi8e+x7PHiceex5/Hnsa4x7bGsMaLxrTGpsanxqLGsMa4xp7Gg8a4xr7Gr8aaxqjHpsaoxpTGpsa2xrfGrcKgwqjCsMKcwq3CkMK/wrjCmMKOwq7Cq8KUwqjCh8KhwpDCm8KiwqPCnMKgwo/CjcKIwp7CmMK7wpvCuMKXwrnCgMKLwpTCvMKbwrDCn8OOxbjFs8WgxYvFo8WmxafFhcWwxabFsMWDxaHFgMWrxZvFqMW+xaDFlMWnxabFt8WcxaDFtsW4xZPFscWQxb/FtsWYxZPFusWkxZfEncWHxJI="
local _key1 = 242
local _key2 = 216

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
