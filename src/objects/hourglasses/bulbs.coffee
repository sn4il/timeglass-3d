module.exports = (props) ->
  THREE = require 'three'

  jsonLoader = new THREE.JSONLoader()
  {geometry} = jsonLoader.parse require '../../assets/3d/bulbs-1-8th.json'

  # Restoring the original geometry from one-eighth.
  geometry.merge geometry, new THREE.Matrix4().makeRotationY Math.PI / 2
  geometry.merge geometry, new THREE.Matrix4().makeRotationY Math.PI
  geometry.merge geometry, new THREE.Matrix4().makeRotationX Math.PI

  geometry.mergeVertices()
  geometry.computeFaceNormals()
  geometry.computeVertexNormals()

  material = new THREE.MeshPhongMaterial
    color: switch props.theme
      when 'lite' then 0xffffff
      when 'dark' then 0x999999

    transparent: true
    opacity: 0.5

    shininess: 500

    reflectivity:    0.5
    refractionRatio: 0.2

  if props.environment?
    imageLoader = new THREE.ImageLoader()
    imageLoader.crossOrigin = ''

    imageLoader.load props.environment, (image) ->
      offscreenCanvas = document.createElement 'canvas'
      offscreenCanvas.width  = 512
      offscreenCanvas.height = 512

      (offscreenCanvas.getContext '2d').drawImage image, 0, 0, 512, 512

      material.envMap = new THREE.CubeTexture [0 ... 6].map -> offscreenCanvas
      material.envMap.mapping = THREE.CubeRefractionMapping
      material.envMap.format  = THREE.RGBFormat
      material.envMap.needsUpdate = true

      material.needsUpdate = true

  bulbs = {}

  for unit in ['minute', 'hour', 'day']
    bulbs[unit] = new THREE.Mesh geometry, material
    bulbs[unit].name = 'bulbs'
    bulbs[unit].renderOrder = 1

    bulbs[unit].scale.set 0.01, 0.01, 0.01

  return bulbs

