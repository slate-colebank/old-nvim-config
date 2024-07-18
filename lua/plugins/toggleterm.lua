return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config=function()
		require("toggleterm").setup {
      open_mapping = [[<A-t>]],
			direction = 'float',
			autochdir = true,
      size = 40,
      shade_terminals = true,
      shading_factor = 1,
	}
end
}
