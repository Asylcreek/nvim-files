return {
	"echasnovski/mini.bufremove",
	version = "*",
	event = "BufEnter",
	config = function()
		local bufremove = require("mini.bufremove")

		-- most of these function come from Astronvim
		--- Check if a buffer is valid
		---@param bufnr number? The buffer to check, default to current buffer
		---@return boolean # Whether the buffer is valid or not
		function is_valid(bufnr)
			if not bufnr then
				bufnr = 0
			end
			return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
		end

		--- Close a given buffer
		---@param bufnr? number The buffer to close or the current buffer if not provided
		---@param force? boolean Whether or not to force close the buffers or confirm changes (default: false)
		local function close(bufnr, force)
			if not bufnr or bufnr == 0 then
				bufnr = vim.api.nvim_get_current_buf()
			end

			if is_valid(bufnr) and #vim.api.nvim_list_bufs() > 1 then
				if not force and vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
					local bufname = vim.fn.expand("%")
					local empty = bufname == ""
					if empty then
						bufname = "Untitled"
					end
					local confirm =
						vim.fn.confirm(('Save changes to "%s"?'):format(bufname), "&Yes\n&No\n&Cancel", 1, "Question")
					if confirm == 1 then
						if empty then
							return
						end
						vim.cmd.write()
					elseif confirm == 2 then
						force = true
					else
						return
					end
				end
				bufremove.delete(bufnr, force)
			else
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
				vim.cmd(
					("silent! %s %d"):format(
						(force or buftype == "terminal") and "bdelete!" or "confirm bdelete",
						bufnr
					)
				)
			end
		end

		--- Close all buffers
		---@param keep_current? boolean Whether or not to keep the current buffer (default: false)
		---@param force? boolean Whether or not to force close the buffers or confirm changes (default: false)
		local function close_all(keep_current, force)
			if keep_current == nil then
				keep_current = false
			end
			local current = vim.api.nvim_get_current_buf()
			for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
				if not keep_current or bufnr ~= current then
					close(bufnr, force)
				end
			end
		end

		vim.keymap.set("n", "<leader>c", close, { desc = "Close buffer" })
		vim.keymap.set("n", "<leader>C", function()
			close(0, true)
		end, { desc = "Force close buffer" })
		vim.keymap.set("n", "<leader>bc", function()
			close_all(true)
		end, { desc = "Close all buffers except current" })
		vim.keymap.set("n", "<leader>bC", function()
			close_all()
		end, { desc = "Close all buffers" })

		return vim
	end,
}
