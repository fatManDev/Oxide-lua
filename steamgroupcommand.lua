PLUGIN.Title = "Steamgroup command"
PLUGIN.Description = "Lets users to /servergroup to get the uri for the steamgroup of the server."
PLUGIN.Version = "0.1"
PLUGIN.Author = "ForgotteN"

function PLUGIN:Init()
	print("SGC is loading... ")
	-- Load the config file
	local b, res = config.Read( "cfg_SGC" )
	self.Config = res or {}
	if (not b) then
		self:LoadDefaultConfig()
		if (res) then config.Save( "cfg_SGC" ) end
		self:AddChatCommand( "sgroup", self.sGroup )
	end
	print("SGC loaded successfully")
end

function PLUGIN:Reload( netuser, cmd, args )
	if netuser:CanAdmin() then
		plugins.Reload("steamgroup command")
	else
		rust.Notice(netuser, "You are not an admin!")
	end
end
	
function PLUGIN:sGroup( "" )

function PLUGIN:LoadDefaultConfig()
	self.Config.helpline = "replace the text below to make /sgroup display something else."
	self.Config.groupUrl = "This text shows up in chat."
end
