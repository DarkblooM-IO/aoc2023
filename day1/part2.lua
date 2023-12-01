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

local lines = LinesFrom("wordlist.txt")
local result = 0
local numbers = {
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine"
}

for _, line in pairs(lines) do
  local buffer = {}
  for i = 1, #numbers do
    local fst, _ = line:find(numbers[i])
    local _, lst = line:find(".*"..numbers[i])
    if fst and lst then
      buffer[#buffer + 1] = i
    end
  end
end
