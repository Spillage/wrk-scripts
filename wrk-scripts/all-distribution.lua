function init(args)
    local p = {}
    headers = {["Content-Type"] = "application/json"}

    p[1] = wrk.format("POST", "/test",
    req = table.concat(p)
end

function request()
  return req  
end

function parseJson(json)
    local str = {}
    local escapes = { r='\r', n='\n', b='\b', f='\f', t='\t', Q='"',
        ['\\'] = '\\', ['/']='/' }
    json = json:gsub('([^\\])\\"', '%1\\Q'):gsub('"(.-)"', function(s)
        str[#str+1] = s:gsub("\\(.)", function(c) return escapes[c] end)
        return "$"..#str
    end):gsub("%s", ""):gsub("%[","{"):gsub("%]","}"):gsub("null", "nil")
    json = json:gsub("(%$%d+):", "[%1]="):gsub("%$(%d+)", function(s)
        return ("%q"):format(str[tonumber(s)])
    end)
    return assert(loadstring("return "..json))()
end

function done(summary, latency, requests)
    local json = string.format([[
{
    "summary": {
        "bytes": "%d",
        "duration": "%d",
        "errors": {
            "connect": "%d",
            "read": "%d",
            "status": "%d",
            "timeout": "%d",
            "write": "%d"
        },
        "requests": "%d"
    },
    "latency": {
        "mean": "%d",
        "percentiles": {
            "0": "%d",
            "1": "%d",
            "2": "%d",
            "3": "%d",
            "4": "%d",
            "5": "%d",
            "6": "%d",
            "7": "%d",
            "8": "%d",
            "9": "%d",
            "10": "%d",
            "11": "%d",
            "12": "%d",
            "13": "%d",
            "14": "%d",
            "15": "%d",
            "16": "%d",
            "17": "%d",
            "18": "%d",
            "19": "%d",
            "20": "%d",
            "21": "%d",
            "22": "%d",
            "23": "%d",
            "24": "%d",
            "25": "%d",
            "26": "%d",
            "27": "%d",
            "28": "%d",
            "29": "%d",
            "30": "%d",
            "31": "%d",
            "32": "%d",
            "33": "%d",
            "34": "%d",
            "35": "%d",
            "36": "%d",
            "37": "%d",
            "38": "%d",
            "39": "%d",
            "40": "%d",
            "41": "%d",
            "42": "%d",
            "43": "%d",
            "44": "%d",
            "45": "%d",
            "46": "%d",
            "47": "%d",
            "48": "%d",
            "49": "%d",
            "50": "%d",
            "51": "%d",
            "52": "%d",
            "53": "%d",
            "54": "%d",
            "55": "%d",
            "56": "%d",
            "57": "%d",
            "58": "%d",
            "59": "%d",
            "60": "%d",
            "61": "%d",
            "62": "%d",
            "63": "%d",
            "64": "%d",
            "65": "%d",
            "66": "%d",
            "67": "%d",
            "68": "%d",
            "69": "%d",
            "70": "%d",
            "71": "%d",
            "72": "%d",
            "73": "%d",
            "74": "%d",
            "75": "%d",
            "76": "%d",
            "77": "%d",
            "78": "%d",
            "79": "%d",
            "80": "%d",
            "81": "%d",
            "82": "%d",
            "83": "%d",
            "84": "%d",
            "85": "%d",
            "86": "%d",
            "87": "%d",
            "88": "%d",
            "89": "%d",
            "90": "%d",
            "91": "%d",
            "92": "%d",
            "93": "%d",
            "94": "%d",
            "95": "%d",
            "96": "%d",
            "97": "%d",
            "98": "%d",
            "99": "%d",
            "100": "%d"
        },
        "stdev": "%d"
    }
}
    ]],
    summary.bytes,
    summary.duration,
    summary.errors.connect,
    summary.errors.read,
    summary.errors.status,
    summary.errors.timeout,
    summary.errors.write,
    summary.requests,
    latency.mean,
    latency.min,
    latency:percentile(1),
    latency:percentile(2),
    latency:percentile(3),
    latency:percentile(4),
    latency:percentile(5),
    latency:percentile(6),
    latency:percentile(7),
    latency:percentile(8),
    latency:percentile(9),
    latency:percentile(10),
    latency:percentile(11),
    latency:percentile(12),
    latency:percentile(13),
    latency:percentile(14),
    latency:percentile(15),
    latency:percentile(16),
    latency:percentile(17),
    latency:percentile(18),
    latency:percentile(19),
    latency:percentile(20),
    latency:percentile(21),
    latency:percentile(22),
    latency:percentile(23),
    latency:percentile(24),
    latency:percentile(25),
    latency:percentile(26),
    latency:percentile(27),
    latency:percentile(28),
    latency:percentile(29),
    latency:percentile(30),
    latency:percentile(31),
    latency:percentile(32),
    latency:percentile(33),
    latency:percentile(34),
    latency:percentile(35),
    latency:percentile(36),
    latency:percentile(37),
    latency:percentile(38),
    latency:percentile(39),
    latency:percentile(40),
    latency:percentile(41),
    latency:percentile(42),
    latency:percentile(43),
    latency:percentile(44),
    latency:percentile(45),
    latency:percentile(46),
    latency:percentile(47),
    latency:percentile(48),
    latency:percentile(49),
    latency:percentile(50),
    latency:percentile(51),
    latency:percentile(52),
    latency:percentile(53),
    latency:percentile(54),
    latency:percentile(55),
    latency:percentile(56),
    latency:percentile(57),
    latency:percentile(58),
    latency:percentile(59),
    latency:percentile(60),
    latency:percentile(61),
    latency:percentile(62),
    latency:percentile(63),
    latency:percentile(64),
    latency:percentile(65),
    latency:percentile(66),
    latency:percentile(67),
    latency:percentile(68),
    latency:percentile(69),
    latency:percentile(70),
    latency:percentile(71),
    latency:percentile(72),
    latency:percentile(73),
    latency:percentile(74),
    latency:percentile(75),
    latency:percentile(76),
    latency:percentile(77),
    latency:percentile(78),
    latency:percentile(79),
    latency:percentile(80),
    latency:percentile(81),
    latency:percentile(82),
    latency:percentile(83),
    latency:percentile(84),
    latency:percentile(85),
    latency:percentile(86),
    latency:percentile(87),
    latency:percentile(88),
    latency:percentile(89),
    latency:percentile(90),
    latency:percentile(91),
    latency:percentile(92),
    latency:percentile(93),
    latency:percentile(94),
    latency:percentile(95),
    latency:percentile(96),
    latency:percentile(97),
    latency:percentile(98),
    latency:percentile(99),
    latency.max,
    latency.stdev)

    io.stderr:write(json)
end
