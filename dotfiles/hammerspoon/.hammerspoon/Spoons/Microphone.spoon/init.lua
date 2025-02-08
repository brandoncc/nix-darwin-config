local module = {}

local poll_frequency_in_seconds = 60

local audiodevice = require("hs.audiodevice")
local watcher = require("hs.audiodevice.watcher")
local timer = require("hs.timer")
local poll_timer = nil
local light_is_on = false

local function turn_on_sign()
  if not light_is_on then
    hs.http.post("http://homeassistant.local:8123/api/webhook/-1WqyVehFdbmeTBQxub5gaXKc")
    light_is_on = true
    print("Using a mic, turning on 'on air' sign")
  end
end

local function turn_off_sign()
  if light_is_on then
    hs.http.post("http://homeassistant.local:8123/api/webhook/-qDRcWRsj6zb-hDbIGjQZUA_T")
    light_is_on = false
    print("Not using a mic, turning off 'on air' sign")
  end
end

local function any_input_in_use()
  for _, device in ipairs(audiodevice.allInputDevices()) do
    if device:inUse() then
      return true
    end
  end

  return false
end

local update_status = function()
  if any_input_in_use() then
    turn_on_sign()
  else
    turn_off_sign()
  end
end

local stop_status_poll = function()
  if poll_timer ~= nil then
    poll_timer:stop()
    poll_timer = nil
  end
end

local start_status_poll = function()
  stop_status_poll()
  poll_timer = timer.doEvery(poll_frequency_in_seconds, update_status)
end

local audio_watcher_callback = function(_, event_name, event_scope, _)
  if event_scope == "inpt" or event_scope == "glob" then
    if event_name == "gone" then
      update_status()
    end
  end
end

local setupDeviceCallbacks = function()
  for _, device in ipairs(audiodevice.allInputDevices()) do
    device:watcherCallback(audio_watcher_callback)
    device:watcherStart()
  end
end

local clearDeviceCallbacks = function()
  for _, device in ipairs(audiodevice.allInputDevices()) do
    if device:watcherIsRunning() then
      device:watcherCallback(nil)
    end

    device:watcherStop()
  end
end

local resetAudioCallbacks = function()
  clearDeviceCallbacks()
  setupDeviceCallbacks()
end

local all_devices_watcher = function(event_type)
  if event_type == "dev#" then
    resetAudioCallbacks()
  end
end

module.start = function()
  watcher.setCallback(all_devices_watcher)
  watcher.start()
  setupDeviceCallbacks()

  -- sometimes the signal doesn't get sent, so poll as a backup
  start_status_poll()
end

module.stop = function()
  watcher.stop()
  watcher.setCallback(nil)
  clearDeviceCallbacks()
  stop_status_poll()
end

module.start()

return module
