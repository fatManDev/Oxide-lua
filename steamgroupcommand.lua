PLUGIN.Title = "Steamgroup Command"
PLUGIN.Description = "Lets users to /servergroup to get the uri for the steamgroup of the server."
PLUGIN.Version = "0.1"
PLUGIN.Author = "ForgotteN"

function PLUGIN:Init()
  print("SGC is loading... ")--YES, this is a StarGate pun.
  self:LoadConfig()
    self:AddChatCommand( "sgroup", self.cmdSGroup )
    self:AddChatCommand("sgcreload", self.cmdReload)
  print( "SGC loaded successfully" )
end
function PLUGIN:loadConfig()
  local b, res = config.Read( "cfg_SGC" )
  self.Config = res or {}
  if (not b) then
    self:LoadDefaultConfig()
    if (res) then config.Save( "cfg_SGC" ) end
end

function PLUGIN:cmdReload( netuser, cmd, args )
  if netuser:CanAdmin() then
    plugins.Reload( "SGCommand" )  --..........This is probably wrong.
  else
    rust.Notice(netuser, "You do not have the required flag(s) to use this command.")
  end
end
  
function PLUGIN:cmdSGroup( netuser, cmd, args )
  rust.Notice(netuser, self.config.groupUrl )
end

function PLUGIN:LoadDefaultConfig()
  self.Config.helpline = "replace the text below to make /sgroup display something else.",
  self.Config.groupUrl = "This text shows up in chat.",
end
