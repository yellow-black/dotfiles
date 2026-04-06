--- @sync entry
return {
  entry = function()
    local _, err = Command("zenhan.exe"):arg("0"):status()
    if err then
      ya.err("ime-off: " .. tostring(err))
    end
  end,
}
