module.exports = (props) ->
  THREE = require 'three'

  fontLoader = new THREE.FontLoader()
  font = fontLoader.parse require '../../assets/fonts/Audiowide-Regular.json'

  material = new THREE.MeshBasicMaterial
    color: switch props.theme
      when 'lite' then 0x222222
      when 'dark' then 0xdddddd

    transparent: true
    opacity: 0.8

  unitNames = {}

  for unit in ['minute', 'hour', 'day']
    text = switch unit
      when 'minute' then 'MINS'
      when 'hour'   then 'HOURS'
      when 'day'    then 'DAYS'

    geometry = new THREE.TextGeometry text,
      font: font
      size: 0.8
      height: 0
      curveSegments: 8

    geometry.center()

    unitNames[unit] = new THREE.Mesh geometry, material
    unitNames[unit].name = 'unit-label'
    unitNames[unit].position.y = -2.5

  return unitNames

