local mt = getrawmetatable(game)
local old = mt.__namecall
local protect = newcclosure or protect_function

if not protect then
    protect = function(f) 
        return f 
    end
end

setreadonly(mt, false)
mt.__namecall = protect(function(self, ...)
local method = getnamecallmethod()

if method == "Kick" then
    wait(9e9)
        return
    end
    return old(self, ...)
end)

hookfunction(game:GetService("Players").LocalPlayer.Kick,protect(function() 
    wait(9e9) 
end))
