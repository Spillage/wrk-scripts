function main(Data)
   local a,b = math.modf(os.clock())
   if b==0 then 
      b='000' 
   else 
      b=tostring(b):sub(3,5) 
   end
 
   local tf=os.date('%Y-%m-%d %H:%M:%S.',os.time())
   trace(tf..b )
 
   local tnf=os.date('%Y%m%d%H%M%S.',os.time())
   trace(tnf.. b) 
 
end
