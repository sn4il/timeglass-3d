module.exports = (props) ->
  THREE = require 'three'

  lighting = (require './lighting.coffee') props

  hourglasses  = (require '../objects/hourglasses.coffee')   props
  timeDisplays = (require '../objects/time-displays.coffee') props

  scene = new THREE.Scene()
  scene.scale.set props.scale, props.scale, props.scale

  for unit in ['minute', 'hour', 'day']
    counter = new THREE.Group()
    counter.name = "composite-#{unit}"

    counter.position.x = switch unit
      when 'minute' then 0 + 8.2 + props.spacing
      when 'hour'   then 0
      when 'day'    then 0 - 8.2 - props.spacing

    counter.add lighting, hourglasses[unit], timeDisplays[unit]

    scene.add counter

  return scene

