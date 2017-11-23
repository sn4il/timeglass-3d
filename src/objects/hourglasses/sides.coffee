module.exports = (props) ->
  THREE = require 'three'

  jsonLoader = new THREE.JSONLoader()
  {geometry} = jsonLoader.parse require '../../assets/3d/sides-1-8th.json'

  # Restoring the original geometry from one-eighth.
  geometry.merge geometry, new THREE.Matrix4().makeRotationY Math.PI / 2
  geometry.merge geometry, new THREE.Matrix4().makeRotationY Math.PI
  geometry.merge geometry, new THREE.Matrix4().makeRotationX Math.PI

  geometry.mergeVertices()
  geometry.computeFaceNormals()
  geometry.computeVertexNormals()

  sides = {}

  for unit in ['minute', 'hour', 'day']
    material = new THREE.MeshPhongMaterial
      color: (new THREE.Color props.hourglasses[unit].sides.color).multiplyScalar switch props.theme
        when 'lite' then 1.0
        when 'dark' then 0.9

      shininess: switch props.hourglasses[unit].sides.material
        when 'matte'   then 5
        when 'plastic' then 50
        when 'glossy'  then 1200

    sides[unit] = new THREE.Mesh geometry, material
    sides[unit].name = 'sides'
    sides[unit].renderOrder = 2

    sides[unit].scale.set 0.01, 0.01, 0.01

  return sides

