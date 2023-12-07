
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
    lines[#lines+1] = line
  end
  return lines
end

function Split(str, sep)
  if not sep then sep = "%s" end
  local output = {}
  for s in str:gmatch("([^"..sep.."]+)") do
    output[#output+1] = s
  end
  return output
end

local lines = LinesFrom("input.txt")
local cardValues = {"2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"}
local sortedCards = {}

for n, line in pairs(lines) do
  line = Split(line)
end
