local lapis = require("lapis")
local app = lapis.Application()
local http = require("lapis.nginx.http")

app:get("/", function(self)
  return [[
    <form method="POST" action="/geturl">
      <input type="text" value="http://ip4.me/" name="url" />
      <input type="submit" value="Get" />
    </form>
    ]]
end)

app:post("/geturl", function(self)
  local url = self.req.params_post.url
  print(url)
  local body, status_code, headers = http.simple(url)
  return body
end)

return app
