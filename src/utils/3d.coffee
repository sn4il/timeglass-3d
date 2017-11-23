module.exports = do ->
  THREE = require 'three'

  resDigitSlot = (slot)    -> (slot.getObjectByName "digit-#{i}").visible = false for i in [0 .. 9]
  setDigitSlot = (slot, i) -> (slot.getObjectByName "digit-#{i}").visible = true

  updateTimeSlot = (timeSlot, time) ->
    resDigitSlot timeSlot.children[i] for i in [0 ... 4 + 3]

    if 0 <= time < 10
      setDigitSlot timeSlot.children[1], 0
      setDigitSlot timeSlot.children[2], time

    setDigitSlot timeSlot.children[i + 1], "#{time}"[i] for i in [0 ... 2] if 10   <= time < 100
    setDigitSlot timeSlot.children[i + 4], "#{time}"[i] for i in [0 ... 3] if 100  <= time < 1000
    setDigitSlot timeSlot.children[i],     "#{time}"[i] for i in [0 ... 4] if 1000 <= time < 10000

  return {resDigitSlot, setDigitSlot, updateTimeSlot}

