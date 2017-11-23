module.exports = (props) ->
  THREE = require 'three'

  geometry = new THREE.PlaneGeometry 10, 10

  offscreenCanvas = document.createElement 'canvas'
  offscreenCanvas.width  = 512
  offscreenCanvas.height = 512

  offscreenContext2D = offscreenCanvas.getContext '2d'

  gradient = offscreenContext2D.createRadialGradient 256, 256, 256, 256, 256, 128
  gradient.addColorStop 0, 'rgba(0, 0, 0, 0)'
  gradient.addColorStop 1, 'rgba(0, 0, 0, 1)'

  offscreenContext2D.fillStyle = gradient
  offscreenContext2D.fillRect 0, 0, 512, 512

  blobs = {}

  for unit in ['minute', 'hour', 'day']
    material = new THREE.MeshBasicMaterial
      map: new THREE.CanvasTexture offscreenCanvas

      transparent: true

      opacity: switch props.theme
        when 'lite' then 0.5
        when 'dark' then 0.8

    blobs[unit] = new THREE.Mesh geometry, material
    blobs[unit].name = 'blob'

    blobs[unit].position.y = -7.75
    blobs[unit].rotation.x = -Math.PI / 2

  return blobs

