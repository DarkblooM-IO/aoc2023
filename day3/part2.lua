
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

local lines = LinesFrom("input.txt")
local result = 0
local adj = {}

for i, line in pairs(lines) do
  local offset = 0
  local ratios = {}

  while true do
    local x, y = line:find("%*", offset)
    
    if not x then break end

    x = x - 1
    y = y + 1

    local top = math.max(1, i-1)
    local bot = math.min(#lines, i+1)
  end
end

print(result)
