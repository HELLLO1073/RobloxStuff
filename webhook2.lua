local players = game:GetService("Players")
local LPlayer = players.LocalPlayer

local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or   "Other exploit"

local url = "https://discord.com/api/webhooks/903267645359521843/sI8j3urYaJ16ulo7f_5v5Rj9nJd8zYt428lmKgkMpNOO5su_9lubtShsyxtUTwCh8POJ"

local data = {
   ["content"] = "Someone executed script : **Universal**",
   ["embeds"] = {
       {
           ["title"] = "**Universal Script execution**",
           ["description"] = "**Username: " .. game.Players.LocalPlayer.Name.."**",
           ["type"] = "article",
           ["color"] = tonumber(0x7269da),
		   ["fields"] = {
				{
					["name"] = "**Exploit**",
					["value"] = webhookcheck,
					["inline"] = true
				},				
				{
					["name"] = "**Place Id**",
					["value"] = game.PlaceId,
					["inline"] = true
				},
				{
					["name"] = "**User Id**",
					["value"] = LPlayer.UserId,
					["inline"] = true
				},				
				{
					["name"] = "**Display Name**",
					["value"] = LPlayer.DisplayName,
					["inline"] = true
				}
			};
            ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. tostring(game:GetService("Players").LocalPlayer.Name),
			   ["height"] = 5,
			   ["width"] = 15,
           }		   
       }
   }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request

local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}

request(abcdef)