
-- --------------
-- | unfinished |
-- --------------

function FileExists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function LinesFrom(file)
  if not FileExists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function Split(str, sep)
  if sep == nil then sep = "%s" end
  local t = {}
  for s in str:gmatch("([^"..sep.."]+)") do
    t[#t+1] = s
  end
  return t
end

local lines  = LinesFrom("input.txt")
local colors = {"red", "blue", "green"}

for _, line in pairs(lines) do
  local id = line:match("^Game (%d+):")
  local max = {}
  for i = 1, #colors do
    local matches = line:gmatch("(%d+) "..colors[i])
    max[colors[i]] = math.max(matches)
  end
  io.write(line.." => ")
  for k, v in pairs(max) do
    io.write(k..":"..v().." ")
  end
  print("\n\n")
end
