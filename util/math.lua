local M = {}

---Returns rounded integer from `v`
---@param value number
---@return integer
function M.round(value)
	if tostring(value):find("%.") == nil then
		return math.floor(value)
	else
		local dec = tonumber(tostring(value):match("%.%d+"))
		if dec >= 0.5 then
			return math.ceil(value)
		else
			return math.floor(value)
		end
	end
end

return M

