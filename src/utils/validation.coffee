module.exports = do ->
  {error} = require './logging.coffee'

  expandProperty = (props, propFullName) ->
    propFullName.split('.').reduce (value, propName) ->
      value?[propName]
    , props

  validateTypeSet = (props, propFullName, typeSet) ->
    constructors = []

    for type in typeSet
      constructors.push switch type
        when 'boolean' then Boolean
        when 'number'  then Number
        when 'string'  then String
        when 'date'    then Date

    value = expandProperty props, propFullName

    return true unless value? and constructors.indexOf(value.constructor) < 0

    unless typeSet.length is 1
      error "
        The value of the '#{propFullName}' property
        should be a #{typeSet.slice(0, -1).join(', a ')} or a #{typeSet.slice(-1)[0]}.
      "

    else
      error "
        The value of the '#{propFullName}' property should be a #{type}.
      "

  validateValueSet = (props, propFullName, valueSet) ->
    value = expandProperty props, propFullName

    return true unless value? and valueSet.indexOf(value) < 0

    error "
      The value of the '#{propFullName}' property
      should be \"#{valueSet.slice(0, -1).join('\", \"')}\" or \"#{valueSet.slice(-1)[0]}\".
    "

  return {validateTypeSet, validateValueSet}

