--init variables
local id1 = 28
local id2 = 1
local id3 = 2
local id4 = 3
local id5 = 4
local id6 = 5
local id7 = 6 
local id8 = 7 --type your IDs

local a = peripheral.wrap("right") 

--startup
rednet.open("top")
a.setCursorPos(1,1)
a.setTextColor(colors.orange)
a.write("drone_1:")
a.setTextColor(colors.white)

--functions:
local function DynamicTextPrint(_cursX, _cursY, _text, _protocol) --function for display text from rednet
    id, receiveData = rednet.receive(_protocol)
    a.setCursorPos(_cursX, _cursY)
    a.write("                                                                                                                                                                                                ") --clear 1 string
    a.setCursorPos(_cursX, _cursY)
    a.setTextColor(colors.green )
    a.write(_text)
    a.setTextColor(colors.blue )
    a.write(receiveData) 
end


local function DynamicTextPrint1(_cursX, _cursY, _text, _protocol) --function for display text from rednet
    id, receiveData = rednet.receive(_protocol)
    a.setCursorPos(_cursX, _cursY)
    a.write("                                                                                                                                                                                                ") --clear 1 string
    a.setCursorPos(_cursX, _cursY)
    a.setTextColor(colors.green )
    a.write(_text)
    a.setTextColor(colors.blue )
    a.write(receiveData) 
end


local function TextPrintL(_cursX, _cursY, _text)--function for display text from var
    a.setCursorPos(_cursX, _cursY)
a.write("                                                                                                                                                                                                ")--clear 1 string
    a.setCursorPos(_cursX, _cursY)
    a.write(_text)
end


function ending() --for normal end of main cycle
    a.setCursorPos(1, 1)
    os.sleep(0)
end


function stream1()
while true do
    id, ds = rednet.receive("compas")
    if (ds == 0) then
    	a.setTextColor(colors.green)
    	TextPrintL(3, 7, "diection: ^")
    end
    if (ds == 1) then
    	a.setTextColor(colors.green)
    	TextPrintL(3, 7, "diection: >")
    end
    if (ds == -1) then
    	a.setTextColor(colors.green)
    	TextPrintL(3, 7, "diection: <")
    end
    if (ds == 2) then
    	a.setTextColor(colors.green)
    	TextPrintL(3, 7, "diection: V")
    end
end
end

function stream2()
while true do
    DynamicTextPrint(3, 6, "block under: ", "down")
end
end

function stream3()
    while true do
        DynamicTextPrint(3, 2, "fuel: ", "fuel")
end
end

function stream4()
    while true do
        DynamicTextPrint(3, 3, "position: ", "coords")
end
end

function stream5()
    while true do
        DynamicTextPrint(3, 3, "position: ", "coords")
end
end

function stream6()
    while true do
        DynamicTextPrint(3, 4, "blok over: ", "up")
end
end


function stream7()
    while true do
        DynamicTextPrint(3, 5, "block in front of: ", "front")
end
end
parallel.waitForAll(stream1, stream2, stream3, stream4, stream5, stream6, stream7)
