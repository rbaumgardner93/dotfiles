local ok, legendary = pcall(require, "legendary")
if not ok then
	return
end

legendary.setup({ auto_register_which_key = false })
