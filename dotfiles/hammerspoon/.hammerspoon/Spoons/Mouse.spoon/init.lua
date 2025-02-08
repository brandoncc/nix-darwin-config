local module = {}

local eventtap = require("hs.eventtap")
local event = eventtap.event

local mouseButtonHandler = function(e)
  local buttonNumber = e:getProperty(event.properties.mouseEventButtonNumber)

  -- button 3 is a "back" button on my mouse that I click on accident sometimes but never on purpose
  if buttonNumber == 3 then
    return true -- consume the event (disabling it)
  else
    return false -- do nothing to the event, just pass it along
  end
end

module.mouseButtonListener = eventtap.new({ event.types.otherMouseDown }, mouseButtonHandler)

module.start = function()
  module.mouseButtonListener:start()
end

module.stop = function()
  module.mouseButtonListener:stop()
end

module.start() -- autostart

return module
