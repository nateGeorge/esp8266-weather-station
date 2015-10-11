-- DHT22 sensor logic
function get_sensor_Data() 
    DHT= require("dht22_min")
    DHT.read(4)
    temperature = DHT.getTemperature()
    humidity = DHT.getHumidity()
 
    if humidity == nil then
        print("Error reading from DHT22")
    else
        print("Temperature: "..(temperature / 10).."."..(temperature % 10).." deg C")
        print("Humidity: "..(humidity / 10).."."..(humidity % 10).."%")
    end
    DHT = nil
    package.loaded["dht22_min"]=nil
end

get_sensor_Data()
--tmr.alarm(1, 5000, 1, function() get_sensor_Data() end)