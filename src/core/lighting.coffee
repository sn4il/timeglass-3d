module.exports = (props) ->
  THREE = require 'three'

  lightIntensityRatio = switch props.theme
    when 'lite' then 1.0
    when 'dark' then 0.8

  mainLight = new THREE.SpotLight 0xffffff, 0.8 * lightIntensityRatio, 200; mainLight.position.set  24,  4,  44
  fillLight = new THREE.SpotLight 0xffffff, 0.5 * lightIntensityRatio, 200; fillLight.position.set -24, -4,  24
  backLight = new THREE.SpotLight 0xffffff, 0.5 * lightIntensityRatio, 200; backLight.position.set   0,  0, -24

  ambientLight = new THREE.AmbientLight 0xffffff, 0.25 * lightIntensityRatio

  lighting = new THREE.Group()
  lighting.name = 'lighting'

  lighting.add [
    mainLight
    fillLight
    backLight

    ambientLight
  ]...

  return lighting

