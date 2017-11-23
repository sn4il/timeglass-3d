module.exports = do ->
  THREE = require 'three'

  {MS_IN_MINUTE} = require './utils/time.coffee'

  {msIn, unitsIn}  = require './utils/time.coffee'
  {updateTimeSlot} = require './utils/3d.coffee'

  {log} = require './utils/logging.coffee'

  props = null

  renderer = null
  scene    = null
  camera   = null

  animateTurn       = null
  animateFlow       = null
  animateOnTable    = null
  animateLookAround = null

  mixers = minute: [], hour: [], day: []

  timeNow  = null
  timeThen = null

  animate = ->
    requestAnimationFrame animate

    # If the plugin is used as a countdown,
    # time will be "freezed" at the last moment to stop animaiton(s).
    timeNow = switch props.mode
      when 'timer'     then new Date()
      when 'countdown' then Math.min new Date(), (new Date props.date) - 1

    mixers[unit][i].update (timeNow - timeThen) / 1000 for i in [0 ... 8] for unit in ['minute', 'hour', 'day']

    timeThen = timeNow

    animateTurn       scene, timeNow
    animateFlow       scene, timeNow
    animateOnTable    scene, timeNow if props.onTableMode
    animateLookAround scene, timeNow if props.lookAroundMode

    for unit in ['minute', 'hour', 'day']
      timeSlot = (scene.getObjectByName "composite-#{unit}").getObjectByName 'time-slot'

      # If the plugin is used as a countdown,
      # the amount of minutes should always be rounded up.
      offset = switch props.mode
        when 'timer'     then 0
        when 'countdown' then 1 - MS_IN_MINUTE

      updateTimeSlot timeSlot, unitsIn timeNow - (new Date props.date) + offset + 1, unit

    renderer.render scene, camera

  return (_props = {}, noInfo = false, noWarnings = false) ->
    return unless props = (require './props.coffee') _props

    log "v#{VERSION}" unless noInfo

    renderer = (require './core/renderer.coffee') props
    scene    = (require './core/scene.coffee')    props
    camera   = (require './core/camera.coffee')   props

    animateTurn = (require './animation/turn.coffee') props
    animateFlow = (require './animation/flow.coffee') props

    animateOnTable    = (require './animation/on-table.coffee')    props if props.onTableMode
    animateLookAround = (require './animation/look-around.coffee') props if props.lookAroundMode

    props.container.appendChild renderer.domElement
    props.container.style.overflow = 'hidden'

    unless props.transparent
      unless props.environment?
        props.container.style.backgroundImage = switch props.theme
            when 'lite' then 'linear-gradient(#eeeeee, #ffffff)'
            when 'dark' then 'linear-gradient(#555555, #666666)'

      else
        props.container.style.backgroundImage    = "url(#{props.environment})"
        props.container.style.backgroundSize     = 'cover'
        props.container.style.backgroundPosition = 'center'

    keyframes = (require './assets/3d/sand-keyframes.json').map (keyframe) -> THREE.KeyframeTrack.parse keyframe
    clip = new THREE.AnimationClip 'flow', 10, keyframes

    for unit in ['minute', 'hour', 'day']
      composite = scene.getObjectByName "composite-#{unit}"

      lowerSand = composite.getObjectByName 'sand-lower'
      upperSand = composite.getObjectByName 'sand-upper'

      for i in [0 ... 4]
        mixers[unit].push new THREE.AnimationMixer lowerSand.children[i]
        mixers[unit].push new THREE.AnimationMixer upperSand.children[i]

      ((mixers[unit][i].clipAction clip).setDuration (msIn unit) / 1000).play() for i in [0 ... 8]

    timeNow  = new Date()
    timeThen = new Date props.date

    requestAnimationFrame animate

