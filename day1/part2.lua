
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

function FindForward(haystack, needles, map)
  for i = 1, #needles do
    if haystack:sub(#haystack - #needles + 2, #haystack) == needles[i] then
      return map[i]
    end
  end
  return nil
end

local lines = LinesFrom("wordlist.txt")
local result = 0
local needles = {
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9"
}
local digits = {
  1, 2, 3, 4, 5, 6, 7, 8, 9,
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
}

for _, line in pairs(lines) do
  local fst
  for i = 1, #line do
    fst = FindForward(line:sub(1, i), needles, digits)
    if fst ~= nil then break end
  end
  print(line, fst and line:sub(fst, #line) or nil)
end
