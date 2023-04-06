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
    	rednet.broadcast(fuel, "fuel")
    	rednet.broadcast(position, "coords")
    	rednet.broadcast(front.name, "front")
    	rednet.broadcast(up.name, "up")
    	rednet.broadcast(down.name, "down")
    	sleep(0)	
    end
end

--stream2
function control()
    facing = 0
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
            facing = facing - 1
            if (facing == -2) then
            	facing = 2
            end 
            rednet.send(id, facing, "compas")
        end
        if (command == "d") then
            turtle.turnRight()
            facing = facing + 1
            if (facing == 3) then
            	facing = -1
            end 
            rednet.send(id, facing, "compas")
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