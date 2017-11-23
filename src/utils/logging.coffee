module.exports = do ->
  log   = (message) -> console.log   "[Timeglass 3D] #{message}"
  warn  = (message) -> console.warn  "[Timeglass 3D] #{message}"
  error = (message) -> console.error "[Timeglass 3D] #{message}"

  return {log, warn, error}

