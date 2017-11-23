module.exports = do ->
  MS_IN_MINUTE = 1000 * 60
  MS_IN_HOUR   = 1000 * 60 * 60
  MS_IN_DAY    = 1000 * 60 * 60 * 24

  msIn = (unit) ->
    switch unit
      when 'minute' then MS_IN_MINUTE
      when 'hour'   then MS_IN_HOUR
      when 'day'    then MS_IN_DAY

  unitsIn = (ms, unit) ->
    switch unit
      when 'minute' then Math.floor Math.abs ms % MS_IN_HOUR / MS_IN_MINUTE
      when 'hour'   then Math.floor Math.abs ms % MS_IN_DAY / MS_IN_HOUR
      when 'day'    then Math.floor Math.abs ms / MS_IN_DAY

  return {MS_IN_MINUTE, MS_IN_HOUR, MS_IN_DAY, msIn, unitsIn}

