-- Super Smash Bros. Melee (NTSC v1.02)

local game = {
	memorymap = {}
}

local controllers = {
	[1] = 0x804C1FAC + 0x44 * 0,
	[2] = 0x804C1FAC + 0x44 * 1,
	[3] = 0x804C1FAC + 0x44 * 2,
	[4] = 0x804C1FAC + 0x44 * 3,
}

local controller_struct = {
	[0x00] = { type = "int",	name = "controller.%d.buttons.pressed" },
	--[0x04] = { type = "int",	name = "controller.%d.buttons.pressed_previous" },
	--[0x08] = { type = "int",	name = "controller.%d.buttons.instant" },
	--[0x10] = { type = "int",	name = "controller.%d.buttons.released" },
	--[0x1C] = { type = "byte",	name = "controller.%d.analog.byte.l" },
	--[0x1D] = { type = "byte",	name = "controller.%d.analog.byte.r" },
	[0x20] = { type = "float",	name = "controller.%d.joystick.x" },
	[0x24] = { type = "float",	name = "controller.%d.joystick.y" },
	[0x28] = { type = "float",	name = "controller.%d.cstick.x" },
	[0x2C] = { type = "float",	name = "controller.%d.cstick.y" },
	[0x30] = { type = "float",	name = "controller.%d.analog.l" },
	[0x34] = { type = "float",	name = "controller.%d.analog.r" },
	[0x41] = { type = "byte",	name = "controller.%d.plugged" },
}

game.memorymap[0x806E490A] = {
	type = "data",
	len = 31,
	name = "slippi.player.1.name",
	debug = true
}

game.memorymap[0x806E4929] = {
	type = "data",
	len = 31,
	name = "slippi.player.2.name",
	debug = true
}

for port, address in ipairs(controllers) do
	for offset, info in pairs(controller_struct) do
		game.memorymap[address + offset] = {
			type = info.type,
			debug = info.debug,
			name = info.name:format(port),
		}
	end
end

function game.translateAxis(x, y)
	return x, y
end

function game.translateTriggers(l, r)
	return l, r
end

return game