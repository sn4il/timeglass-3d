module.exports = (props) ->
  {msIn} = require '../utils/time.coffee'

  return (scene, now) ->
    for unit in ['minute', 'hour', 'day']
      stream = (scene.getObjectByName "composite-#{unit}").getObjectByName 'stream'

      diff = Math.abs now - new Date props.date

      stream.material.opacity = (1 - Math.pow (diff % msIn unit) / (msIn unit) * 2 - 1, 4) * switch unit
        when 'minute' then 0.8 * 0.4 + Math.random() * (1 - 0.4)
        when 'hour'   then 0.4 * 0.6 + Math.random() * (1 - 0.6)
        when 'day'    then 0.2 * 0.8 + Math.random() * (1 - 0.8)

