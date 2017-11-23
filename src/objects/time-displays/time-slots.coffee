module.exports = (props) ->
  THREE = require 'three'

  fontLoader = new THREE.FontLoader()
  font = fontLoader.parse require '../../assets/fonts/AlfaSlabOne-Regular.json'

  baseMaterial = new THREE.MeshBasicMaterial
    color: switch props.theme
      when 'lite' then 0x222222
      when 'dark' then 0xdddddd

    transparent: true
    opacity: 0.8

  edgeMaterial = new THREE.LineBasicMaterial
    color: switch props.theme
      when 'lite' then 0x222222
      when 'dark' then 0xdddddd

  baseGeometries = []
  edgeGeometries = []

  for i in [0 .. 9]
    baseGeometries[i] = new THREE.TextGeometry "#{i}",
      font: font
      size: 2.5
      height: 0
      curveSegments: 12

    edgeGeometries[i] = new THREE.EdgesGeometry baseGeometries[i]

    baseGeometries[i].center()
    edgeGeometries[i].center()

  timeSlots = {}

  for unit in ['minute', 'hour', 'day']
    timeSlots[unit] = new THREE.Group()
    timeSlots[unit].name = 'time-slot'

    for j in [0 ... 4 + 3]
      digitSlot = new THREE.Group()
      digitSlot.name = "digit-slot-#{j}"
      digitSlot.position.x = 2.7 * j - if j < 4 then 4.05 else 13.5

      for i in [0 .. 9]
        digit = new THREE.Group()
        digit.name = "digit-#{i}"
#       digit.visible = false

        digit.add [
          new THREE.Mesh         baseGeometries[i], baseMaterial
          new THREE.LineSegments edgeGeometries[i], edgeMaterial
        ]...

        digitSlot.add digit

      timeSlots[unit].add digitSlot

  return timeSlots

