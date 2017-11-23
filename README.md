# Timeglass 3D

![timeglass-3d-logo](https://user-images.githubusercontent.com/9012519/33182084-321e39be-d07b-11e7-99c1-64f52c90399b.png)

A fancy 3D timer for your website. See it in action
[here](https://codepen.io/sn4il/full/OOZNEv/),
[here](https://codepen.io/sn4il/full/mqLLWN/) and
[here](https://codepen.io/sn4il/full/ooddmr/).

## Installation

If you're using npm:

```
$ npm install --save timeglass-3d
```

Otherwise, you can just manually include Three.js and Timeglass 3D via a `<script>` tag:

> Please note that the link below always points to the latest version of the plugin.<br>
> You can choose a specific version [here](https://cdn.jsdelivr.net/npm/timeglass-3d/lib/).

```html
<!-- Three.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/88/three.min.js"></script>

<!-- Timeglass 3D -->
<script src="https://cdn.jsdelivr.net/npm/timeglass-3d/lib/timeglass-3d.min.js"></script>
```

## Getting Started

First, we'll need some markup:

```html
<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Timeglass 3D — Getting Started</title>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/88/three.min.js"></script>

    <!-- Timeglass 3D -->
    <script src="https://cdn.jsdelivr.net/npm/timeglass-3d/lib/timeglass-3d.min.js"></script>

    <!-- Embeded JS -->
    <script>
      // Here goes our JS code...
    </script>
  </body>
</html>
```

The example below should give you a basic idea on how to use the plugin. Let's take a look:

```js
timeglass3D({
  container: document.getElementById("timeglass3DContainer"),

  date: "2018.10.31", // A date to count from (or to count to).
  mode: "countdown",  // Using the plugin as a countdown. By default it's used as a timer.

  theme: 'dark', // Use dark theme. By default light theme is used.

  // Set this property to the URL of an image you want to use as a background.
  // The image will also be used as a reflection on the bulbs.
  environment: 'https://images.unsplash.com/photo-1482263231623-6121096b0d3f?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=24f73a95a688362711adddbbf7e578af',

  onTableMode: false,   // Set this to true to make the hourglasses behave like if they are on a table.
  lookAroundMode: true, // You'll be able to look around (using a mouse).

  hourglasses: {
    all: {
      sides: {
        material: 'glossy', // Make the framing glossy.
        color: '#4e4e6e'    // Set the color of the framing.
      },

      sands: {
        color: '#cfcffe' // Set the color of the sand.
      }
    }
  }
});
```

You can see the result [here](https://codepen.io/sn4il/full/BmVyRy/).
For more information, see the section below.

## API Reference

**timeglass3D([props] [, noInfo] [, noWarnings]) ⇒  `undefined`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [props] | `object` | `{...}` | Plugin properties. |
| [noInfo] | `boolean` | `false` | If set to `true`, info won't be displayed. |
| [noWarnings] | `boolean` | `false` | If set to `true`, warnings won't be displayed. |

**[props] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [container] | `HTMLElement` | `<body>` | The DOM element you want the plugin to use as a container. |
| [date] | `Date` `string` `number` | `Date.now()` | The date or time to count from (or to count to). It can be an instance of `Date`, any supported date string or amount of time in milliseconds. |
| [mode] | `"timer"` `"countdown"` | `"timer"` | Tells whether to count up or to count down from the date mentioned above. |
| [theme] | `"lite"` `"dark"` | `"lite"` | Light or dark theme. |
| [environment] | `string` | | The URL to an image, that will be used as a reflection on the bulbs. If the `transparent` property is set to `false` (default), will also be used as a background. |
| [transparent] | `boolean` | `false` | If set to `true`, the background will be transparent. |
| [onTableMode] | `boolean` | `false` | If set to `true`, the hourglasses will rise and then go down while being turned and shadows under the hourglasses will appear. |
| [lookAroundMode] | `boolean` | `false` | If set to `true`, you will be able to look around (using a mouse). |
| [hourglasses] | `object` | `{...}` | Allows you to customize the look and feel of the hourglasses. |
| [scale] | `number` | `1` | The scale of the scene. |
| [spacing] | `number` | `3.5` | The distance between the hourglasses. |
| [offsetX] | `number` | `0` | Adjusts the scene horizontally. |
| [offsetY] | `number` | `0` | Adjusts the scene vertically. |

**[props.hourglasses] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [all] | `object` | `{...}` | Global properties. Will be redefined by any of the below. |
| [minute] | `object` | | Properties of the minute hourglass (the one on the right). |
| [hour] | `object` | | Properties of the hour hourglass (the one in the middle). |
| [day] | `object` | | Properties of the day hourglass (the one on the left). |

**[props.hourglasses.{all | minute | hour | day}] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [sides] | `object` | `{...}` | Properties of the framing. |
| [sands] | `object` | `{...}` | Properties of the sand. |

**[props.hourglasses.{all | minute | hour | day}.sides] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [material] | `"matte"` `"plastic"` `"glossy"` | `"plastic"` | The material of the framing. |
| [color] | `string` `number` | `"#28282f"` | The color of the framing. |

**[props.hourglasses.{all | minute | hour | day}.sands] : `object`**

| Param | Type | Default | Description |
| :--- | :---: | :---: | :--- |
| [color] | `string` `number` | `"#fefe88"` | The color of the sand. |

