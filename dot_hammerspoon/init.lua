hs.window.animationDuration = 0 -- Disable animations globally

-- Define hyper key (all modifiers)
local hyper = { "cmd", "alt", "ctrl", "shift" }

-- Application bindings
hs.hotkey.bind(hyper, "m", function()
	hs.application.launchOrFocus("Spotify")
end)

hs.hotkey.bind(hyper, "c", function()
	hs.urlevent.openURL("https://chat.openai.com")
end)

hs.hotkey.bind(hyper, "g", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(hyper, "f", function()
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind(hyper, "t", function()
	hs.application.launchOrFocus("Todoist")
end)

hs.hotkey.bind(hyper, "s", function()
	hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "z", function()
	hs.application.launchOrFocus("zoom.us")
end)

local function shouldMaximizeWindow(win)
	print("zzz", win, win:isStandard(), win:isMaximizable(), win:subrole())
	return win and win:isStandard() and win:isMaximizable() and win:subrole() ~= "AXSystemDialog"
end

local function maximizeWindow(win)
	if shouldMaximizeWindow(win) then
		win:maximize(0) -- 0ms duration
	end
end

local function maximizeAllWindows()
	local allWindows = hs.window.allWindows()
	for _, win in ipairs(allWindows) do
		maximizeWindow(win)
	end
end

-- Maximize new windows as they are created
hs.window.filter.default:subscribe(hs.window.filter.windowCreated, function(win)
	hs.timer.doAfter(0.1, function()
		maximizeWindow(win)
	end)
end)

-- Watch for screen changes (e.g., connecting an external monitor)
local screenWatcher = hs.screen.watcher.new(function()
	hs.timer.doAfter(2, maximizeAllWindows) -- Add slight delay to handle screen updates
end)
screenWatcher:start()
