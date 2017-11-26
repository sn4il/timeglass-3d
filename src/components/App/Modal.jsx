import React from 'react';

import Layer from 'grommet/components/Layer.js';

import Article from 'grommet/components/Article.js';
import Section from 'grommet/components/Section.js';

import Code from './Modal/Code.jsx';

export default (props) =>
  <Layer {...props} closer={true}>
    <Article>
      <Section>
        <h2>Add It to Your Website</h2>

        <p>HTML:</p>

        <Code content={`
          <div id="timeglass3DContainer" class="timeglass-3d-container"></div>

          <!-- Three.js -->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/88/three.min.js"></script>

          <!-- Timeglass 3D -->
          <script src="https://cdn.jsdelivr.net/npm/timeglass-3d/lib/timeglass-3d.min.js"></script>
        `} />

        <p>JavaScript:</p>

        <Code content={`
          timeglass3D({
            container: document.querySelector('#timeglass3DConatiner'),

            date: '${props.date}',
            mode: '${props.mode}',

            theme: '${props.theme}',

            onTableMode: ${props.onTableMode},
            lookAroundMode: ${props.lookAroundMode},

            hourglasses: {
              all: {
                sides: {
                  material: 'matte',
                  color: '#222222'
                }
              }
            },

            scale: 0.9,
            offsetY: 2
          });
        `} />

        <p>You can customize it to look like <a href='https://codepen.io/sn4il/full/OOZNEv/' target='_blank'>this</a>, <a href='https://codepen.io/sn4il/full/mqLLWN/' target='_blank'>this</a> or <a href='https://codepen.io/sn4il/full/ooddmr/' target='_blank'>this</a>. <a href='https://github.com/sn4il/timeglass-3d#api-reference' target='_blank'>Learn how!</a></p>
      </Section>
    </Article>
  </Layer>

