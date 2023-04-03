--startup
rednet.open("back")

id = 28

while true do
    event, key = os.pullEvent()
	term.clear()
	term.setCursorPos(1, 1)
        term.write("drone control system")
        term.setCursorPos(1, 2)
        term.write("action:")
    if (event=="key") then
    --print("debug:", tostring(key))
        
    
    if (key == 87) then
    	term.setCursorPos(7, 3)
        term.write("^")
        term.setCursorPos(7, 4)
        term.write("|")
        rednet.send(id, "w", "drone1")
    end
    if (key == 68) then
    	term.setCursorPos(7, 4)
        term.write("-->")
        rednet.send(id, "d", "drone1")
    end
    if (key == 65) then
    	term.setCursorPos(6, 4)
        term.write("<--")
        rednet.send(id, "a", "drone1")
    end

    if (key == 83) then
    	term.setCursorPos(7, 4)
        term.write("|")
        term.setCursorPos(7, 5)
        term.write("Y")
        rednet.send(id, "s", "drone1")
    end
    	
    if (key == 32) then
    	term.setCursorPos(7, 4)
        term.write("up")
        rednet.send(id, "q", "drone1")
    end
    
    if (key == 340 or key == 344) then
    	term.setCursorPos(7, 4)
        term.write("down")
        rednet.send(id, "e", "drone1")
    end
    os.sleep(0.1)
    	for i = 3, 4 do
    	    term.setCursorPos(1,i)
    	    term.write("                                   ")
    	end
    	--print(event)
        --print(key)
    end
end
