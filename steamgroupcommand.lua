PLUGIN.Title = "Steamgroup Command"
PLUGIN.Description = "Lets users to /servergroup to get the uri for the steamgroup of the server."
PLUGIN.Version = "0.1"
PLUGIN.Author = "ForgotteN"

function PLUGIN:Init()
	print("SGC is loading... ") --........................YES, this is a StarGate pun.
	self:LoadConfig() --..................................loads configs
		--..................................................commands
		self:AddChatCommand( "sgroup", self.sGroup )  --....displays group url
		self:AddChatCommand("sgcreload", self.reload) --....reloads plugin
	end
	print( "SGC loaded successfully" )
end
function PLUGIN:loadConfig()
  local b, res = config.Read( "cfg_SGC" )
  self.Config = res or {}
  if (not b) then
    self:LoadDefaultConfig()
    if (res) then config.Save( "cfg_SGC" ) end
end

function PLUGIN:reload( netuser, cmd, args )
	if netuser:CanAdmin() then
		plugins.Reload( "Steamgroup Command" )  --..........This is probably wrong.
	else
		rust.Notice(netuser, "You do not have the required flag(s) to use this command.")
	end
end
	
function PLUGIN:sGroup( netuser, cmd, args )
  rust.Notice(netuser, self.config.groupUrl )
end

function PLUGIN:LoadDefaultConfig()
	self.Config.helpline = "replace the text below to make /sgroup display something else."
	self.Config.groupUrl = "This text shows up in chat."
end
