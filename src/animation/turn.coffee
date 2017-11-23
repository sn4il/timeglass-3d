module.exports = (props) ->
  {msIn}            = require '../utils/time.coffee'
  {quadIn, quadOut} = require '../utils/easing.coffee'

  return (scene, now) ->
    for unit in ['minute', 'hour', 'day']
      composite = scene.getObjectByName "composite-#{unit}"

      main = composite.getObjectByName 'main'

      lowerSand = composite.getObjectByName 'sand-lower'
      upperSand = composite.getObjectByName 'sand-upper'

      stream = composite.getObjectByName 'stream'

      diff = Math.abs now - new Date props.date

      unless diff < 500
        main.rotation.x = rotation = switch
          when diff % (msIn unit) > (msIn unit) - 500 then quadIn  Math.PI * 0.0, Math.PI * 0.5, diff % 500 / 500
          when diff % (msIn unit) <               500 then quadOut Math.PI * 1.5, Math.PI * 2.0, diff % 500 / 500
          else 0

      opacity = Math.abs (main.rotation.x % Math.PI / Math.PI) * 2 - 1

      lowerSand.children[0].material.opacity = opacity
      upperSand.children[0].material.opacity = opacity

      stream.visible = main.rotation.x is 0

