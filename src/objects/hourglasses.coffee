module.exports = (props) ->
  THREE = require 'three'

  bulbs = (require './hourglasses/bulbs.coffee') props
  sides = (require './hourglasses/sides.coffee') props
  sands = (require './hourglasses/sands.coffee') props
  blobs = (require './hourglasses/blobs.coffee') props

  hourglasses = {}

  for unit in ['minute', 'hour', 'day']
    main = new THREE.Group()
    main.name = 'main'

    main.add bulbs[unit], sides[unit], sands[unit]

    hourglasses[unit] = new THREE.Group()
    hourglasses[unit].name = 'hourglass'

    hourglasses[unit].add main
    hourglasses[unit].add blobs[unit] if props.onTableMode

  return hourglasses

