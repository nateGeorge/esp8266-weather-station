OSS = 1 -- oversampling setting (0-3)
SDA_PIN = 6
SCL_PIN = 7

bmp180 = require("bmp180")
bmp180.init(SDA_PIN, SCL_PIN)
bmp180.read(OSS)
t = bmp180.getTemperature()
p = bmp180.getPressure()

-- temperature in degrees Celsius  and Farenheit
print("Temperature: "..(t/10).." deg C")
print("Temperature: "..(9 * t / 50 + 32).." deg F")

-- pressure in differents units
print("Pressure: "..(p).." Pa")
print("Pressure: "..(p / 100).." hPa")
print("Pressure: "..(p / 100).." mbar")
print("Pressure: "..(p * 75 / 10000).." mmHg")
print(math.floor(p * 75 / 10000).." mmHg")

-- release module
bmp180 = nil
package.loaded["bmp180"]=nil
