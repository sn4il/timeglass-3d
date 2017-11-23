module.exports = (props) ->
  THREE = require 'three'

  timeSlots = (require './time-displays/time-slots.coffee') props
  unitNames = (require './time-displays/unit-names.coffee') props

  timeDisplays = {}

  for unit in ['minute', 'hour', 'day']
    timeDisplays[unit] = new THREE.Group()
    timeDisplays[unit].name = 'time-display'
    timeDisplays[unit].position.y = unless props.onTableMode then 12.5 else 14

    timeDisplays[unit].add timeSlots[unit], unitNames[unit]

  return timeDisplays

