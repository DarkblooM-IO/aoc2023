
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

local lines  = LinesFrom("input.txt")
local colors = {"red", "green", "blue"}
local possible = {}
local result = 0

for _, line in pairs(lines) do
  local id = tonumber(line:match("^Game (%d+):"))
  local max = {}
  for i = 1, #colors do
    local matches = line:gmatch("(%d+) "..colors[i])
    local nums = {}
    for v in matches do
      nums[#nums+1] = tonumber(v)
    end
    max[colors[i]] = math.max(table.unpack(nums))
  end
  if max["red"] >= 12 and max["green"] >= 13 and max["blue"] >= 14 then
    possible[#possible+1] = id
  end
end

for i = 1, #possible do
  result = result + possible[i]
end

print(result)
