local tbl = {}

local info = game.ReplicatedStorage.BytenetStorage.Networking.Value

local baseNum = info:match('"bytenet_use"%s*:%s*(%d+)')
local grabballNum = info:match('"bytenet_findBall"%s*:%s*(%d+)')

local selectRollNum = info:match('"bytenet_selectRole"%s*:%s*(%d+)')

if baseNum then
	tbl.base = string.char(tonumber(baseNum)) .. string.char(1)
end

if grabballNum then
	tbl.grabball = string.char(tonumber(grabballNum))
end

if selectRollNum then
	tbl.cfATeam = string.char(tonumber(selectRollNum)) .. string.char(1) .. string.char(1) .. string.char(0) .. "A"
	tbl.cfBTeam = string.char(tonumber(selectRollNum)) .. string.char(1) .. string.char(1) .. string.char(0) .. "B"
	
	tbl.gkATeam = string.char(tonumber(selectRollNum)) .. string.char(5) .. string.char(1) .. string.char(0) .. "A"
	tbl.gkBTeam = string.char(tonumber(selectRollNum)) .. string.char(5) .. string.char(1) .. string.char(0) .. "B"
end

local folder = Instance.new("Folder")
folder.Name = "BUFFERSTRINGS"

for i, v in pairs(tbl) do
	local val = Instance.new("StringValue")
	val.Value = v
	val.Name = i
	val.Parent = folder
end

folder.Parent = game.Lighting
