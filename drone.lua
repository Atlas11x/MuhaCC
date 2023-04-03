id = 16

rednet.open("left")
--stream1
function collectAndSendData()
    while true do 
    	fuel = turtle.getFuelLevel()
    	x, y, z = gps.locate()
    	position = "x: " .. tostring(x) .. " y: " .. tostring(y) .. " z: " .. tostring(z)
    	success, front = turtle.inspect()
    	success, up = turtle.inspectUp()
    	success, down = turtle.inspectDown()
    	rednet.send(id, fuel, "fuel")
    	rednet.send(id, position, "coords")
    	rednet.send(id, front.name, "front")
    	rednet.send(id, up.name, "up")
    	rednet.send(id, down.name, "down")
    	sleep(0)	
    end
end

--stream2
function control()
    while true do
        idCheck, command = rednet.receive("drone1")
        if (command == "w") then
            turtle.forward()
        end
        if (command == "s") then
            turtle.back()
        end
        if (command == "a") then
            turtle.turnLeft()
            rednet.send(id, "0", "compas")
        end
        if (command == "d") then
            turtle.turnRight()
            rednet.send(id, "1", "compas")
        end
        if (command == "q") then
            turtle.up()
        end
        if (command == "e") then
            turtle.down()
        end
    end
end
parallel.waitForAll(control, collectAndSendData)
