module.exports = (props) ->
  {validateTypeSet, validateValueSet} = require './utils/validation.coffee'
  {error}                             = require './utils/logging.coffee'

  props.container ?= document.body

  props.date ?= Date.now()
  props.mode ?= 'timer'

  props.theme ?= 'lite'

  props.environment ?= null
  props.transparent ?= false

  props.onTableMode    ?= false
  props.lookAroundMode ?= false

  props.hourglasses ?= {}

  props.hourglasses.all ?= {}

  props.hourglasses.all.sides ?= {}
  props.hourglasses.all.sands ?= {}

  props.hourglasses.all.sides.material ?= 'plastic'
  props.hourglasses.all.sides.color    ?= '#28282f'

  props.hourglasses.all.sands.color ?= '#fefe88'

  for unit in ['minute', 'hour', 'day']
    props.hourglasses[unit] =
      sides:
        material: props.hourglasses?[unit]?.sides?.material ? props.hourglasses.all.sides.material
        color:    props.hourglasses?[unit]?.sides?.color    ? props.hourglasses.all.sides.color

      sands:
        color: props.hourglasses?[unit]?.sands?.color ? props.hourglasses.all.sands.color

  props.scale   ?= 1
  props.spacing ?= 3.5
  props.offsetX ?= 0
  props.offsetY ?= 0

  return unless validateTypeSet props, 'date', ['number', 'string', 'date']

  if props.date? and isNaN (new Date props.date).getTime()
    error '
      The \'date\' property contains an unsupported date format.
    '; return

  return unless validateValueSet props, 'mode', ['timer', 'countdown']

  return unless validateValueSet props, 'theme', ['lite', 'dark']

  return unless validateTypeSet props, 'environment', ['string']
  return unless validateTypeSet props, 'transparent', ['boolean']

  return unless validateTypeSet props, 'onTableMode',    ['boolean']
  return unless validateTypeSet props, 'lookAroundMode', ['boolean']

  for unit in ['all', 'minute', 'hour', 'day']
    return unless validateValueSet props, "hourglasses.#{unit}.sides.material", ['matte', 'plastic', 'glossy']
    return unless validateTypeSet  props, "hourglasses.#{unit}.sides.color",    ['string']
    return unless validateTypeSet  props, "hourglasses.#{unit}.sands.color",    ['string']

  return unless validateTypeSet props, 'scale',   ['number']
  return unless validateTypeSet props, 'spacing', ['number']
  return unless validateTypeSet props, 'offsetX', ['number']
  return unless validateTypeSet props, 'offsetY', ['number']

  return props

