module.exports = do ->
  normalize = (t) -> Math.max 0, Math.min 1, t

  quadIn    = (a, b, t) -> t = normalize t; a + (b - a) * t * t
  quadOut   = (a, b, t) -> t = normalize t; a + (b - a) * t * (2 - t)
  quadInOut = (a, b, t) -> t = normalize t; a + (b - a) * if t < 0.5 then t * t * 2 else t * (4 - t * 2) - 1

  return {quadIn, quadOut, quadInOut}

