local Math = require("util.math")

local M = {}

---@alias rgb integer[] uint8 list
---@alias hsv integer[] h 0-360, s 0-100, b 0-100

---Convert decimal to hexadecimal, e.g. `16777215` -> `FFFFFF`
---@param decimal integer
---@return string
function M.dec_to_hex(decimal)
	return string.format("%X", math.abs(decimal))
end

---Convert hexadecimal to decimal, e.g. `FFFFFF` -> `16777215`
---@param hex string
---@return integer
function M.hex_to_dec(hex)
	return tonumber(hex, 16)
end

---Convert decimal to rgb table, e.g. `16777215` -> `{ 255, 255, 255 }`
---@param decimal integer
---@return rgb
function M.dec_to_rgb(decimal)
	return {
		bit.band(bit.rshift(decimal, 16), 255),
		bit.band(bit.rshift(decimal, 8), 255),
		bit.band(decimal, 255),
	}
end

---Convert hexadecimal to rgb table, e.g. `FFFFFF` -> `{ 255, 255, 255 }`
---@param hex string
---@return rgb
function M.hex_to_rgb(hex)
	return #hex ~= 6 and { 0, 0, 0 } or M.dec_to_rgb(M.hex_to_dec(hex))
end

---Convert rgb table to decimal, e.g. `{ 255, 255, 255 }` -> `16777215`
---@param rgb rgb
---@return integer
function M.rgb_to_dec(rgb)
	return bit.lshift(rgb[1], 16) + bit.lshift(rgb[2], 8) + rgb[3]
end

---Convert rgb table to hexadecimal, e.g. `{ 255, 255, 255 }` -> `FFFFFF`
---@param rgb rgb
---@return string
function M.rgb_to_hex(rgb)
	return table.concat({
		string.format("%X", rgb[1]),
		string.format("%X", rgb[2]),
		string.format("%X", rgb[3]),
	})
end

---Convert rgb to hsv, e.g. `{ 255, 255, 255 }` -> `{ 0, 0, 100 }`
---@param rgb rgb
---@return hsv
function M.rgb_to_hsv(rgb)
	local _r, _g, _b = rgb[1] / 255, rgb[2] / 255, rgb[3] / 255
	local max, min = math.max(_r, _g, _b), math.min(_r, _g, _b)
	local d, h, s, v
	v = max
	d = max - min
	s = max == 0 and 0 or d / max
	if max == min then
		h = 0
	else
		if max == _r then
			h = (_g - _b) / d + (_g < _b and 6 or 0)
		elseif max == _g then
			h = (_b - _r) / d + 2
		elseif max == _b then
			h = (_r - _g) / d + 4
		end
	end
	return {
		Math.round(h / 6 * 360),
		Math.round(s * 100),
		Math.round(v * 100)
	}
end

---Convert hexadecimal to hsv table, e.g. `FFFFFF` -> `{ 0, 0, 100 }`
---@param hex string
---@return rgb
function M.hex_to_hsv(hex)
	return #hex ~= 6 and { 0, 0, 0 } or M.rgb_to_hsv(M.dec_to_rgb(M.hex_to_dec(hex)))
end

---Convert hsv to rgb, e.g. `{ 0, 0, 100 }` -> `{ 255, 255, 255 }`
---@param hsv hsv
---@return rgb
function M.hsv_to_rgb(hsv)
	local _h, _s, _v = hsv[1] / 360, hsv[2] / 100, hsv[3] / 100
	local r, g, b, i, f, p, q, t, a
	i = math.floor(_h * 6)
	f = _h * 6 - i
	p = _v * (1 - _s)
	q = _v * (1 - f * _s)
	t = _v * (1 - (1 - f) * _s)
	a = i % 6
	if a == 0 then
		r = _v
		g = t
		b = p
	elseif a == 1 then
		r = q
		g = _v
		b = p
	elseif a == 2 then
		r = p
		g = _v
		b = t
	elseif a == 3 then
		r = p
		g = q
		b = _v
	elseif a == 4 then
		r = t
		g = p
		b = _v
	elseif a == 5 then
		r = _v
		g = p
		b = q
	end
	return {
		Math.round(r * 255),
		Math.round(g * 255),
		Math.round(b * 255)
	}
end

---Convert hsv to decimal table, e.g. `{ 0, 0, 100 }` -> `16777215`
---@param hsv hsv
---@return number
function M.hsv_to_dec(hsv)
	return M.rgb_to_dec(M.hsv_to_rgb(hsv))
end

---Updates saturation by adding the value.
---@param decimal number
---@param value number
---@return number
function M.saturate(decimal, value)
	local hsv = M.rgb_to_hsv(M.dec_to_rgb(decimal))
	local s = math.min(100, math.max(0, hsv[2] + value))
	return M.hsv_to_dec({ hsv[1], s, hsv[3] })
end

---Updates brightness by adding the value.
---@param decimal number
---@param value number
---@return number
function M.brighter(decimal, value)
	local hsv = M.rgb_to_hsv(M.dec_to_rgb(decimal))
	local b = math.min(100, math.max(0, hsv[3] + value))
	return M.hsv_to_dec({ hsv[1], hsv[2], b })
end

return M

