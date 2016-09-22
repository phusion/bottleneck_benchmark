wrk.method = "POST"

local counter = 1
local threads = {}

function setup(thread)
   thread:set("id", counter)
   table.insert(threads, thread)
   counter = counter + 1
end

function init(args)
   requests  = 0
   responses = 0
   errors = 0
end

function request()
   requests = requests + 1
   return wrk.request()
end

function response(status, headers, body)
   if status >= 399 then
      errors = errors + 1
   else
      responses = responses + 1
   end
end

function done(summary, latency, requests)
   local requests = 0
   local responses = 0
   local errors = 0

   for index, thread in ipairs(threads) do
      requests = requests + thread:get("requests")
      responses = responses + thread:get("responses")
      errors = errors + thread:get("errors")
   end

    local msg = "made %d requests and got %d responses and %d errors"
    print(msg:format(requests, responses, errors))
end
