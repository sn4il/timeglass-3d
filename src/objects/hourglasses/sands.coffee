module.exports = (props) ->
  THREE = require 'three'

  jsonLoader = new THREE.JSONLoader()

  lowerSandGeometry = (jsonLoader.parse require '../../assets/3d/sand-lower-1-4th.json').geometry
  upperSandGeometry = (jsonLoader.parse require '../../assets/3d/sand-upper-1-4th.json').geometry

  [lowerSandGeometry, upperSandGeometry].forEach (geometry) ->
    geometry.computeFaceNormals()
    geometry.computeVertexNormals()

  streamGeometry = new THREE.CylinderGeometry 0.05, 0.05, 5.8, 3

  sands = {}

  for unit in ['minute', 'hour', 'day']
    sandMaterial = new THREE.MeshLambertMaterial
      color: new THREE.Color props.hourglasses[unit].sands.color

      transparent: true
      opacity: 1

      morphTargets: true

      side: THREE.DoubleSide

    lowerSand = new THREE.Group()
    lowerSand.name = 'sand-lower'

    upperSand = new THREE.Group()
    upperSand.name = 'sand-upper'

    # Restoring the original shape from one-fourth.
    for i in [0 ... 4]
      lowerSandPart = new THREE.Mesh lowerSandGeometry, sandMaterial
      upperSandPart = new THREE.Mesh upperSandGeometry, sandMaterial

      [lowerSandPart, upperSandPart].forEach (part) ->
        part.rotation.y = i * Math.PI / 2
        part.scale.set 0.01, 0.01, 0.01

      lowerSand.add lowerSandPart
      upperSand.add upperSandPart

    streamMaterial = new THREE.MeshBasicMaterial
      color: (new THREE.Color props.hourglasses[unit].sands.color).multiplyScalar 0.5

      transparent: true
      opacity: 1

    stream = new THREE.Mesh streamGeometry, streamMaterial
    stream.name = 'stream'

    stream.position.y = -2.8

    sands[unit] = new THREE.Group()
    sands[unit].name = 'sands'

    sands[unit].add lowerSand, upperSand, stream

  return sands

