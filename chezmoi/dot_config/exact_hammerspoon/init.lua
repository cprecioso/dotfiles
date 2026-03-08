hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.PaperWM = {
    url = "https://github.com/mogenson/PaperWM.spoon",
    desc = "PaperWM.spoon repository",
    branch = "release",
}

-- spoon.SpoonInstall:andUse("PaperWM", {
--     repo = "PaperWM",
--     config = { screen_margin = 16, window_gap = 2 },
--     start = true,
--     hotkeys = {
--         focus_left  = {{"alt", "cmd"}, "left"},
--         focus_right = {{"alt", "cmd"}, "right"},
--         focus_up    = {{"alt", "cmd"}, "up"},
--         focus_down  = {{"alt", "cmd"}, "down"}
--     }
-- })
