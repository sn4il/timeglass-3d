module.exports = (props) ->
  THREE = require 'three'

  camera = new THREE.PerspectiveCamera 25, props.container.clientWidth / props.container.clientHeight, 0.1, 1000
  camera.name = 'camera'

  camera.position.set props.offsetX, props.offsetY, 80

  addEventListener 'resize', ->
    camera.aspect = props.container.clientWidth / props.container.clientHeight
    camera.updateProjectionMatrix()

  return camera

