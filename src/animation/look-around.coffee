module.exports = (props) ->
  mouseX = -1
  mouseY = -1

  props.container.addEventListener 'mousemove', (event) ->
    mouseX = event.clientX
    mouseY = event.clientY

  props.container.addEventListener 'mouseleave', ->
    mouseX = -1
    mouseY = -1

  return (scene, now) ->
    x = (mouseX - props.container.offsetLeft) / props.container.clientWidth * 2 - 1
    y = (mouseY - props.container.offsetTop) / props.container.clientHeight * (if props.onTableMode then 1 else 2) - 1

    d = Math.sqrt x * x + y * y

    if -1 <= x <= 1 and -1 <= y <= 1
      scene.rotation.x += (y * -0.2 - scene.rotation.x) / 16
      scene.rotation.y += (x * -0.2 - scene.rotation.y) / 16
      scene.position.z += (d * -5.5 - scene.position.z) / 16

    else
      scene.rotation.x -= scene.rotation.x / 64
      scene.rotation.y -= scene.rotation.y / 64
      scene.position.z -= scene.position.z / 64

