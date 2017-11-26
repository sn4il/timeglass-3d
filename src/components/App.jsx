import React from 'react';

import Box   from 'grommet/components/Box.js';
import Split from 'grommet/components/Split.js';

import App from 'grommet/components/App.js';

import Form  from './App/Form.jsx';
import Modal from './App/Modal.jsx';

export default class extends React.Component {
  constructor (props) {
    super(props);

    const now = new Date();

    const d = `0${now.getDate()}`.slice(-2);
    const m = `0${now.getMonth() + 1}`.slice(-2);
    const y = now.getYear() + 1900;

    this.state = {
      options: {
        date: `${m}/${d}/${y}`,
        mode: 'timer',

        theme: 'lite',

        onTableMode: false,
        lookAroundMode: false
      },

      modal: false
    };
  }

  render () {
    return (
      <App centered={false}>
        <Modal {...this.state.options} hidden={!this.state.modal} onClose={() => this.setState({modal: false})} />

        <Split flex='left'>
          <Box full={true}>
            <iframe id='iframe' src='./timeglass-3d.html' frameBorder={0} style={{height: '100%'}} />
          </Box>

          <Box size='medium' pad='small'>
            <Box align='center'>
              <a href='https://github.com/sn4il/timeglass-3d' target='_blank'>
                <img src='https://user-images.githubusercontent.com/9012519/33229008-e7527260-d1ce-11e7-88da-667cbb1cd76b.png' style={{height: '64px'}} />
              </a>
            </Box>

            <p style={{margin: '1em', textAlign: 'center'}}>
              A fancy 3D timer for your website.<br />
              See project's <a href='https://github.com/sn4il/timeglass-3d' target='_blank'>GitHub</a> for documentation.
            </p>

            <Form {...this.state.options} onChange={(options) => this.setState({
              options: Object.assign({}, this.state.options, options)
            }, this.updateIFrame)} />

            <p style={{margin: '1em', textAlign: 'center'}}>
              Like it? <a onClick={() => this.setState({modal: true})}>Add it to your website!</a>
            </p>
          </Box>
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

