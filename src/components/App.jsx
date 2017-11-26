import React from 'react';

import Box   from 'grommet/components/Box.js';
import Split from 'grommet/components/Split.js';

import App     from 'grommet/components/App.js';
import Header  from 'grommet/components/Header.js';
import Sidebar from 'grommet/components/Sidebar.js';

import Image from 'grommet/components/Image.js';

import Form from './App/Form.jsx';

export default class extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      options: {
        mode: 'timer',
        theme: 'lite',
        onTableMode: false,
        lookAroundMode: false
      }
    };
  }

  render () {
    return (
      <App centered={false}>
        <Split flex='left'>
          <Box full={true}>
            <iframe id='iframe' src='./timeglass-3d.html' frameBorder={0} style={{height: '100%'}} />
          </Box>

          <Sidebar pad='small'>
            <Header justify='center'>
              <a href='https://github.com/sn4il/timeglass-3d' target='_blank'>
                <Image size='small' src='https://user-images.githubusercontent.com/9012519/33229008-e7527260-d1ce-11e7-88da-667cbb1cd76b.png' />
              </a>
            </Header>

            <p style={{margin: '1em'}}>
              A fancy 3D timer for your website.
              See project's <a href='https://github.com/sn4il/timeglass-3d' target='_blank'>GitHub</a> page for docs.
            </p>

            <Form {...this.state.options} onChange={(options) => this.setState({
              options: Object.assign({}, this.state.options, options)
            }, this.updateIFrame)} />
          </Sidebar>
        </Split>
      </App>
    );
  }

  updateIFrame () {
    const iframe = document.querySelector('#iframe');

    const params = Object.keys(this.state.options).map((key) => `${key}=${this.state.options[key]}`).join('&');
    const url = `./timeglass-3d.html?${params}`;

    iframe.style.backgroundImage = ({
      lite: 'linear-gradient(#eeeeee, #ffffff)',
      dark: 'linear-gradient(#555555, #666666)'
    })[this.state.options.theme];

    iframe.src = url;
  }
}

