dofile( "./wowhelpers.lua" )

pcall(function() dofile( "./libs/LibStub/LibStub.lua" ) end)
pcall(function() dofile( "./libs/CallbackHandler-1.0/CallbackHandler-1.0.lua" ) end)
pcall(function() dofile( "./libs/LibChatAnims/LibChatAnims.lua" ) end)
pcall(function() dofile( "./libs/AceGUI-3.0/AceGUI-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceConsole-3.0/AceConsole-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceConfig-3.0/AceConfigRegistry-3.0/AceConfigRegistry-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceConfig-3.0/AceConfigCmd-3.0/AceConfigCmd-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceConfig-3.0/AceConfigDialog-3.0/AceConfigDialog-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceConfig-3.0/AceConfig-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceTimer-3.0/AceTimer-3.0.lua" ) end)
dofile( "./libs/AceSerializer-3.0/AceSerializer-3.0.lua" )
pcall(function() dofile( "./libs/ChatThrottleLib/ChatThrottleLib.lua" ) end)
pcall(function() dofile( "./libs/AceComm-3.0/AceComm-3.0.lua" ) end)
pcall(function() dofile( "./libs/AceEvent-3.0/AceEvent-3.0.lua" ) end)
dofile( "./libs/LibCompress/LibCompress.lua" )
pcall(function() dofile( "./libs/LibBabble-Race-3.0/LibBabble-3.0.lua" ) end)
pcall(function() dofile( "./libs/LibBabble-Race-3.0/LibBabble-Race-3.0.lua" ) end)
pcall(function() dofile( "./libs/LibDataBroker-1.1/LibDataBroker-1.1.lua" ) end)
pcall(function() dofile( "./libs/LibButtonGlow-1.0/LibButtonGlow-1.0.lua" ) end)
pcall(function() dofile( "./libs/LibDeflate/LibDeflate.lua" ) end)
pcall(function() dofile( "./libs/LibSerialize/LibSerialize.lua" ) end)

dofile( "./VUHDO.lua" )

dofile( "./libs/LibBase64-1.0-Elv/LibBase64-1.0.lua" )
local LibBase64Elv = LibStub("LibBase64-1.0-ElvUI")

local Compresser = LibStub:GetLibrary("LibCompress")
local LibCompress = LibStub:GetLibrary("LibCompress")
local Encoder = Compresser:GetAddonEncodeTable()
local Serializer = LibStub:GetLibrary("AceSerializer-3.0")
local LibDeflate = LibStub:GetLibrary("LibDeflate")
local LibSerialize = LibStub("LibSerialize")
local configForDeflate = {level = 7}
errorMsg = ""

local JSON = (loadfile "./json.lua")()