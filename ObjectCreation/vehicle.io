Vehicle := Object clone
Vehicle description := "Something to take you to places"
Vehicle description
Vehicle slotNames
Vehicle type

Car := Vehicle clone
Car slotNames
Car description := "A vehicle with 4 wheels, run by gas"

ferrari := Car clone
ferrari description
ferrari type

Car horn := method("Piff Piff" println)
Car horn
ferrari horn

ferrari proto
ferrari getSlot("horn")
Lobby