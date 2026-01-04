-- Ghostty toggle (show/hide) with one hotkey
-- Bundle ID: com.mitchellh.ghostty

local GHOSTTY_BUNDLE_ID = "com.mitchellh.ghostty"

local HOTKEY_MODS = {"alt"}
local HOTKEY_KEY  = "space"

local function toggleGhostty()
  local app = hs.application.get(GHOSTTY_BUNDLE_ID)
  local front = hs.application.frontmostApplication()

  if not app then
    hs.application.launchOrFocusByBundleID(GHOSTTY_BUNDLE_ID)
    return
  end

  if front and front:bundleID() == GHOSTTY_BUNDLE_ID then
    app:hide()
    return
  end
  app:activate(true)
end

hs.hotkey.bind(HOTKEY_MODS, HOTKEY_KEY, toggleGhostty)
