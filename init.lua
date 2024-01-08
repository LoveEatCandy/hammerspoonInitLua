logger = hs.logger.new("sleepSwitch", "debug")
sleepTurnOn = nil
logger.i("sleepSwitch module starting")

function sleepSwitch()
    if (sleepTurnOn == nil or sleepTurnOn == true) and hs.battery.powerSource() == "AC Power" then
        logger.i("disable sleep")
        hs.execute("sudo pmset disablesleep 1", false)
        sleepTurnOn = false
    else if sleepTurnOn == nil or sleepTurnOn == false then
        logger.i("enable sleep")
        hs.execute("sudo pmset disablesleep 0", false)
        sleepTurnOn = true
    end
    end
end

sleepSwitch()

hs.battery.watcher.new(function()
    logger.i("battery status changed")
    sleepSwitch()
end):start()
logger.i("sleepSwitch module started")
