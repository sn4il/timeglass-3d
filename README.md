# Timeglass 3D

![timeglass-3d-logo](https://user-images.githubusercontent.com/9012519/33134278-f89cc40e-cfa7-11e7-9c6f-83be67ca2f5f.png)

A fancy 3D timer for your website. See it in action
[here](https://codepen.io/sn4il/full/OOZNEv/),
[here](https://codepen.io/sn4il/full/mqLLWN/) and
[here](https://codepen.io/sn4il/full/ooddmr/).

## Installation

If you're using npm:

    $ npm install --save timeglass-3d

Otherwise, you can just include it via a `<script>` tag:

    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/88/three.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/timeglass-3d/lib/timeglass-3d.min.js" type="text/javascript"></script>

Timeglass 3D depends on Three.js, so you'll need to include both of the above.

## Getting Started

First, we'll need some markup:

    <!DOCTYPE html>

    <html>
      <head>
        <meta charset="UTF-8">
        <title>Timeglass 3D</title>

        <!-- Embeded CSS -->
        <style>
          html, body, .timeglass-3d-container {
            margin: 0;
            height: 100%;
          }
        </style>
      </head>

      <body>
        <div id="timeglass3DContainer" class="timeglass-3d-container"></div>

        <!-- Three.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/88/three.min.js" type="text/javascript"></script>

        <!-- Timeglass 3D -->
        <script src="https://cdn.jsdelivr.net/npm/timeglass-3d/lib/timeglass-3d.min.js" type="text/javascript"></script>

        <!-- Embeded JS -->
        <script>
          // Here goes our JS code...
        </script>
      </body>
    </html>

Now, let's take a look at the basic example that shows the amount of time passed since the New Year of 2015:

    timeglass3D({
      container: document.getElementById("timeglass3DContainer")
      date: "2015.01.01"
    });

The example above works as a timer. But you can easily turn it into a countdown:

    timeglass3D({
      container: document.getElementById("timeglass3DContainer")

      date: "2018.01.01",
      mode: "countdown"
    });

You can make it fancier by turning on some features:

    timeglass3D({
      container: document.getElementById("timeglass3DContainer")

      date: "2018.01.01",
      mode: "countdown",

      onTableMode: true,
      lookAroundMode: true
    });

For more information, see the section below.

## API Reference

**timeglass3D([props] [, noInfo] [, noWarnings]) ⇒  `undefined`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [props] | `object` | `{ ... }` | Plugin properties. |
| [noInfo] | `boolean` | `false` | If set to `true`, info won't be displayed in the console. |
| [noWarnings] | `boolean` | `false` | If set to `true`, warnings won't be displayed in the console.. |

**[props] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [container] | `HTMLElement` | `<body>` | The DOM element you want the plugin to use as as container. |
| [date] | `Date` `string` `number` | `Date.now()` | The date or time to count from (or to count to). It can be an instance of `Date`, any supported date string or amount of time in milliseconds. |
| [mode] | `"timer"` `"countdown"` | `"timer"` | Tells whether to count up or to count down from the date mentioned above. |
| [theme] | `"lite"` `"dark"` | `"lite"` | Light or dark theme. |
| [environment] | `string` | | An URL to an image, that will be used as a reflection on the bulbs. If the `transparent` property is set to `false` (default), will also be used as a background. |
| [transparent] | `boolean` | `false` | If set to `true`, the background will be transparent. |
| [onTableMode] | `boolean` | `false` | If set to `true`, the hourglasses will rise and then go down while being turned and shadows under the hourglasses will appear. |
| [lookAroundMode] | `boolean` | `false` | If set to `true`, you will be able to look around (using a mouse). |
| [hourglasses] | `object` | `{ ... }` | Allows you to customize the look and feel of the hourglasses. |
| [scale] | `number` | `1` | The scale of the scene. |
| [spacing] | `number` | `3.5` | The distance between the hourglasses. |
| [offsetX] | `number` | `0` | Adjusts the scene horizontally. |
| [offsetY] | `number` | `0` | Adjusts the scene vertically. |

**[props.hourglasses] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [all] | `object` | `{ ... }` | Global properties. Will be redefined by any of the below. |
| [minute] | `object` | | Properties of the minute hourglass (the one on the right). |
| [hour] | `object` | | Properties of the hour hourglass (the one in the middle). |
| [day] | `object` | | Properties of the day hourglass (the one on the left). |

**[props.hourglasses.{all | minute | hour | day}] : **`object`

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [sides] | `object` | `{ ... }` | Properties of the hourglass framing. |
| [sands] | `object` | `{ ... }` | Properties of the sand. |

**[props.hourglasses.{all | minute | hour | day}.sides] : **`object`

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [material] | `"matte"` `"plastic"` `"glossy"` | `"plastic"` | The material of the frame. |
| [color] | `string` `number` | `"#28282f"` | The color of the frame. |

**[props.hourglasses.{all | minute | hour | day}.sands] : **`object`

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [color] | `string` `number` | `"#fefe88"` | The color of the sand. |

