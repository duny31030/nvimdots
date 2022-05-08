local global = require("core.global")

local function bind_option(options)
	for k, v in pairs(options) do
		if v == true then
			vim.cmd("set " .. k)
		elseif v == false then
			vim.cmd("set no" .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

local function load_options()
	local global_local = {
		-- 样式
		termguicolors = true,
		-- 允许使用鼠标
		mouse = "a",
		errorbells = true,
		visualbell = true,
		-- 允许隐藏被修改过的buffer
		hidden = true,

		fileformats = "unix,mac,dos",
		magic = true,
		virtualedit = "block",
		-- utf8
		encoding = "utf-8",
		viewoptions = "folds,cursor,curdir,slash,unix",
		sessionoptions = "curdir,help,tabpages,winsize",
		clipboard = "unnamedplus",
		wildignorecase = true,
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		-- 禁止创建备份文件
		backup = false,
		writebackup = false,
		swapfile = false,

		undodir = global.cache_dir .. "undo/",
		-- directory = global.cache_dir .. "swap/",
		-- backupdir = global.cache_dir .. "backup/",
		-- viewdir = global.cache_dir .. "view/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		history = 2000,
		shada = "!,'300,<50,@100,s10,h",
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
		smarttab = true,
		shiftround = true,
		timeout = true,
		ttimeout = true,
		-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
		timeoutlen = 500,

		ttimeoutlen = 0,
		-- smaller updatetime
		updatetime = 100,
		redrawtime = 1500,
		-- 搜索大小写不敏感，除非包含大写
		ignorecase = true,
		smartcase = true,

		infercase = true,
		-- 边输入边搜索
		incsearch = true,
		wrapscan = true,
		complete = ".,w,b,k",
		inccommand = "nosplit",
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		breakat = [[\ \	;:,!?]],
		startofline = false,
		-- 光标在行首尾时<Left><Right>可以跳到下一行
		whichwrap = "h,l,<,>,[,],~",
		-- split window 从下边和右边出现
		splitbelow = true,
		splitright = true,
		switchbuf = "useopen",
		backspace = "indent,eol,start",
		diffopt = "filler,iwhite,internal,algorithm:patience",
		-- 自动补全不自动选中
		completeopt = "menuone,noselect",
		jumpoptions = "stack",
		-- 使用增强状态栏插件后不再需要 vim 的模式提示
		showmode = false,
		shortmess = "aoOTIcF",
		scrolloff = 2,
		sidescrolloff = 5,
		foldlevelstart = 99,
		ruler = true,
		-- 高亮所在行
		cursorline = true,
		cursorcolumn = true,
		-- 不可见字符的显示
		list = true,
		-- 永远显示 tabline
		showtabline = 2,
		winwidth = 30,
		winminwidth = 10,
		-- 补全最多显示15行
		pumheight = 15,
		helpheight = 12,
		previewheight = 12,
		showcmd = false,
		-- 命令行高为2，提供足够的显示空间
		cmdheight = 2,

		cmdwinheight = 5,
		equalalways = false,
		laststatus = 2,
		display = "lastline",
		showbreak = "↳  ",
		-- 不可见字符的显示
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
		
		pumblend = 10,
		winblend = 10,
		-- 当文件被外部程序修改时，自动加载
		autoread = true,

		autowrite = true,
	}

	local bw_local = {
		undofile = true,
		synmaxcol = 2500,
		formatoptions = "1jcroql",
		textwidth = 80,
		-- 空代替Tab
		expandtab = false,
		-- 新行对其当前行
		autoindent = true,
		-- 缩进4个空格等于一个Tab
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = -1,
		breakindentopt = "shift:2,min:20",
		-- 禁止折行
		wrap = false,
		linebreak = true,
		-- 使用相对行号
		number = true,
		relativenumber = true,
		foldenable = true,
		-- 显示左侧图标指示列
		signcolumn = "yes",
		conceallevel = 0,
		concealcursor = "niv",
	}

	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/local/bin/python3"
	end
	for name, value in pairs(global_local) do
		vim.o[name] = value
	end
	bind_option(bw_local)
end

load_options()
