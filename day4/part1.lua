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
  for sample in str:gmatch("([^"..sep.."]+)") do
    output[#output+1] = sample
  end
  return output
end

function ExtractNumbers(str)
  str = Split(str, "|")
  local output = {}
  for i = 1, #str do
    local nums = str[i]:gmatch("%d+")
    local t = {}
    for m in nums do
      t[#t+1] = tonumber(m)
    end
    output[#output+1] = t
  end
  return output
end

local lines = LinesFrom("input.txt")
local total = 0

for n, line in pairs(lines) do
  local nums = ExtractNumbers(line:sub(9, #line))
  local cardValue = 0

  for i = 1, #nums[1] do
    local current = nums[1][i]
    for j = 1, #nums[2] do
      if current == nums[2][j] then
        cardValue = cardValue == 0 and 1 or cardValue * 2
      end
    end
  end

  total = total + cardValue
end

print(total)
