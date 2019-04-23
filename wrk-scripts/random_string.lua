
function random_str(len)
  local rankStr = ""
  local randNum = 0
  for i=0,len do
    if math.random(1,3)==1 then
      randNum=string.char(math.random(0,26)+65)
    elseif math.random(1,3)==2 then
      randNum=string.char(math.random(0.26)+97)
    else
      randNum=math.random(0,10)
    end
    rankStr=rankStr..randNum
  end
  return rankStr
