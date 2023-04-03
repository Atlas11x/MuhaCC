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



while true do
    a.setTextColor(colors.orange)
    a.write("drone_1:")
    DynamicTextPrint(3, 2, "fuel: ", "fuel")
    DynamicTextPrint(3, 3, "position: ", "coords")
    DynamicTextPrint(3, 4, "blok over: ", "up")
    DynamicTextPrint(3, 5, "block in front of: ", "front")
    DynamicTextPrint(3, 6, "block under: ", "down")
    --DynamicTextPrint(3, 7, "direction: ", "drone1_out")
    ending()
end
