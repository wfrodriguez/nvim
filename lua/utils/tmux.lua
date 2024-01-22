local M = {
	config = {},
	lastCommand = "",
}

local tmux = {
	lastPane = "",
	curPane = "",
}

local escape = vim.fn.shellescape

local defaults = {
	debug = false,
	orientation = "v",
	promptString = "Command? ",
	closeOnExit = false,
	fnNotify = vim.notify,
	fnInput = vim.ui.input,
}

local function empty(s)
	return s == nil or s == ""
end

local function trim(str)
	return str:match("^%s*(.-)%s*$")
end

local function exec(command)
	local tmpfile = os.tmpname()
	local exit = os.execute(command .. " > " .. tmpfile .. " 2> " .. tmpfile .. ".err")

	local stdoutFile = io.open(tmpfile)
	if empty(stdoutFile) then
		error("no output from command: " .. command, 2)
	end
	---@cast stdoutFile -nil
	local stdout = stdoutFile:read("*all")

	local stderrFile = io.open(tmpfile .. ".err")
	if empty(stderrFile) then
		error("no output (stderr) from command: " .. command, 2)
	end
	---@cast stderrFile -nil
	local stderr = stderrFile:read("*all")

	stdoutFile:close()
	stderrFile:close()

	return { code = exit and 0 or 1, out = trim(stdout), err = trim(stderr) }
end

tmux.run = function(command)
	if empty(os.getenv("TMUX")) then
		M.config.fnNotify("No active TMUX instance", "error")
		return ""
	end

	local cmd = "tmux " .. command
	-- print("-> " .. cmd)
	local res = exec(cmd)
	if res.code == 0 then
		return res.out
	end

	return ""
end

tmux.currentWin = function()
	return tmux.run("lsw -F '#{window_id} #{?window_active,X,0}' | grep X | awk '{print $1}'")
end

tmux.currentPane = function()
	tmux.lastPane = tmux.curPane
	tmux.curPane = tmux.run("lsp -F '#{pane_id} #{?pane_active,X,0}' | grep X | awk '{print $1}'")
	return tmux.curPane
end

tmux.hasCurPaneActive = function()
	if empty(tmux.curPane) then
		return false
	end
	out = tmux.run("lsp -F '#{pane_id}' | grep " .. tmux.curPane)

	return out == tmux.curPane
end

tmux.openPane = function()
	if not tmux.hasCurPaneActive() then
		tmux.run("splitw -" .. M.config.orientation)
		tmux.currentPane()
		tmux.run("lastp")
	end
end

tmux.sendKeys = function(keys)
	tmux.openPane()
	tmux.run("send-keys -t " .. tmux.curPane .. " " .. keys)
end

tmux.sendCtrlC = function()
	tmux.run("send-keys -t " .. tmux.curPane .. " C-c")
end

tmux.killPane = function()
	tmux.run("kill-pane -t " .. tmux.curPane)
end

M.setup = function(config)
	M.config = vim.tbl_deep_extend("force", defaults, config or {})
	if vim.fn.executable("tmux") == 0 then
		M.config.fnNotify(M.config.bin .. " not found", "error")
	end
end

M.clearPane = function()
	tmux.sendKeys("C-l")
end

M.promptCommand = function()
	local input = M.config.fnInput({ prompt = M.config.promptString }, function(str)
		if empty(str) then
			M.config.fnNotify("No hay comando a ejecutar", "error")
			return
		end
		M.lastCommand = str
		tmux.sendKeys(escape(M.config.promptString))
		tmux.sendKeys("Enter")
	end)
end

M.runCommand = function(command)
	if not empty(command) then
		M.lastCommand = command
		tmux.sendKeys(escape(command))
		tmux.sendKeys("Enter")
	else
		M.config.fnNotify("No hay comando a ejecutar", "error")
	end
end

M.runLastCommand = function()
	if empty(M.lastCommand) then
		M.config.fnNotify("No hay comando a ejecutar", "error")
		return
	end

	M.sendKeys(escape(M.lastCommand))
end

return M
