module.exports = (props) ->
  {msIn}      = require '../utils/time.coffee'
  {quadInOut} = require '../utils/easing.coffee'

  return (scene, now) ->
    for unit in ['minute', 'hour', 'day']
      main = (scene.getObjectByName "composite-#{unit}").getObjectByName 'main'
      blob = (scene.getObjectByName "composite-#{unit}").getObjectByName 'blob'

      diff = Math.abs now - new Date props.date

      unless diff < 1000
        main.position.y = switch
          when diff % (msIn unit) > (msIn unit) - 1000 then quadInOut 0, 1.5, diff % 1000 / 500
          when diff % (msIn unit) <               1000 then quadInOut 1.5, 0, diff % 1000 / 500 - 1
          else 0

        blob.material.opacity = switch props.theme
          when 'lite' then 0.5 - main.position.y / 4
          when 'dark' then 0.8 - main.position.y / 3

        scale = 1 + main.position.y / 5

        blob.scale.x = scale
        blob.scale.y = scale

