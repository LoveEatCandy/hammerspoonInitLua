logger = hs.logger.new("sleepSwitch", "debug")
sleepTurnOn = nil
logger.i("sleepSwitch module starting")

function sleepSwitch()
    local powerStatus = hs.battery.powerSource()
    logger.i(string.format("battery status changed: %s", powerStatus))
    if powerStatus == "AC Power" then
        if sleepTurnOn == nil or sleepTurnOn == true then
            logger.i("disable sleep")
            hs.execute("sudo pmset disablesleep 1", false)
            sleepTurnOn = false
        end
    else 
        if sleepTurnOn == nil or sleepTurnOn == false then
            logger.i("enable sleep")
            hs.execute("sudo pmset disablesleep 0", false)
            sleepTurnOn = true
        end
    end
end

sleepSwitch()

hs.battery.watcher.new(function()
    sleepSwitch()
end):start()
logger.i("sleepSwitch module started")
