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

local lines  = LinesFrom("input.txt")
local result = 0

for _, v in pairs(lines) do -- loop through every line
  local firstDigit, lastDigit
  for i = 1, #v do -- extract the first digit from the current line
    local char = v:sub(i, i)
    if char:match("%d") then
      firstDigit = char
      break
    end
  end
  for i = #v, 1, -1 do -- extract the last digit from the current line
    local char = v:sub(i, i)
    if char:match("%d") then
      lastDigit = char
      break
    end
  end
  if firstDigit and not lastDigit then -- if the first or last digit is
    lastDigit = firstDigit             -- nil, set both to the same value
  elseif not firstDigit and lastDigit then
    firstDigit = lastDigit
  end
  result = result + (firstDigit .. lastDigit) -- append the final digit to the end result
end

print(result)
