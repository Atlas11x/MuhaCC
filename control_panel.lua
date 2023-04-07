--startup
rednet.open("back")

id = 28

while true do
    event, key = os.pullEvent()
	term.clear()
	term.setCursorPos(1, 1)
        term.setTextColor(colors.black)
        term.setBackgroundColor(colors.green)
        term.write("drone control system      ")
        term.setCursorPos(1, 2)
        term.write("action:                   ")
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
    if (event=="key") then
    --print("debug:", tostring(key))
    
    if (key == 87) then
    	term.setCursorPos(13, 5)
        term.write("^")
        term.setCursorPos(13, 6)
        term.write("|")
        rednet.send(id, "w", "drone1")
    end
    if (key == 68) then
    	term.setCursorPos(13, 6)
        term.write("-->")
        rednet.send(id, "d", "drone1")
    end
    if (key == 65) then
    	term.setCursorPos(12, 6)
        term.write("<--")
        rednet.send(id, "a", "drone1")
    end

    if (key == 83) then
    	term.setCursorPos(13, 6)
        term.write("|")
        term.setCursorPos(13, 7)
        term.write("V")
        rednet.send(id, "s", "drone1")
    end
    	
    if (key == 32) then
    	term.setCursorPos(13, 6)
        term.write("up")
        rednet.send(id, "q", "drone1")
    end
    
    if (key == 340 or key == 344) then
    	term.setCursorPos(13, 6)
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
