PIN = 2 -- data pin GPIO02

dht22 = require("dht22")
dht22.read(PIN)
tmr.alarm(1,5000,0,function()
t=dht22.getTemperature()
h=dht22.getHumidity()

print("temp: ")
print(t)
print("humidity")
print(h)
dht22=nil
package.loaded["dht22"]=nil
end)