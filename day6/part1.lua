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

function ExtractNumbers(str)
  local output = {}
  for m in str:gmatch("%d+") do
    output[#output+1] = tonumber(m)
  end
  return output
end

local lines = LinesFrom("input.txt")
local times = ExtractNumbers(lines[1])
local distances = ExtractNumbers(lines[2])
local margin = 1

for i = 1, #times do
  local wins = {}
  for j = 0, times[i] do
    local currentDistance = j * (times[i] - j)
    if currentDistance > distances[i] then
      wins[#wins+1] = currentDistance
    end
  end
  margin = margin * #wins
end

print(margin)
