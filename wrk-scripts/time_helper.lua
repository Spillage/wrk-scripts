local _M = {};
local ffi = require("ffi")
if pcall(ffi.typeof, "struct timeval") then
else
    ffi.cdef[[
        struct timeval {
            long int tv_sec;
            long int tv_usec;
        };
        int gettimeofday(struct timeval *tv, void *tz);
    ]]
end

local tm = ffi.new("struct timeval");

function _M.current_time_millis()   
    ffi.C.gettimeofday(tm,nil);
    local sec =  tonumber(tm.tv_sec);
    local usec =  tonumber(tm.tv_usec);
    return sec + usec * 10^-3;
end

return _M;
