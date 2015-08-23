dataToSend = {}
OSS = 1 -- oversampling setting (0-3)
SDA_PIN = 6
SCL_PIN = 7

--tmr.alarm(1, 5000, 1, function()
    bmp = require("bmp180")
    sendToSparkfun = require("sendToSparkfun")
    bmp.init(SDA_PIN, SCL_PIN)
    bmp.read(OSS)
    t = bmp.getTemperature()
    p = bmp.getPressure()
    tF = math.floor((9 * t / 50 + 32)*10)/10
    pmmHg = math.floor(p * 75 / 10000)
    dataToSend[1] = {'mmhg', pmmHg}
    dataToSend[2] = {'fahrenheit', tF}
    print("Temperature: "..tF.." deg F")
    print(math.floor(p * 75 / 10000).." mmHg")
    
    sendToSparkfun.sendData(dataToSend, true)
    -- release module
    bmp = nil
    package.loaded["bmp180"]=nil
    sendToSparkfun = nil
    package.loaded["sendToSparkfun"]=nil
    collectgarbage()
--end)

