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

local lines = LinesFrom("input.txt")
local result = 0

for i, line in pairs(lines) do
  local offset = 0
  local valid = {}

  while true do
    local x, y = line:find("%d+", offset)

    if not x then break end

    x = x - 1
    y = y + 1

    local found = false
    local top = math.max(1, i-1)
    local bot = math.min(#lines, i+1)

    for l = top, bot do
      found = found or lines[l]:sub(x, y):match("[^%d.\n]")
    end

    x = x + 1
    y = y - 1

    if found then
      valid[#valid+1] = tonumber(line:sub(x, y))
    end

    offset = y + 1
  end

  for j = 1, #valid do
    result = result + valid[j]
  end
end

print(result)
