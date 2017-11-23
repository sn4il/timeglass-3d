module.exports = (props) ->
  THREE = require 'three'

  renderer = new THREE.WebGLRenderer
    antialias: true
    alpha:     true

  renderer.setSize props.container.clientWidth, props.container.clientHeight

  addEventListener 'resize', ->
    renderer.setSize props.container.clientWidth, props.container.clientHeight

  return renderer

