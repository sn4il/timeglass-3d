import React from 'react';

import Form       from 'grommet/components/Form.js';
import FormFields from 'grommet/components/FormFields.js';
import FormField  from 'grommet/components/FormField.js';

import DateTime    from 'grommet/components/DateTime.js';
import RadioButton from 'grommet/components/RadioButton.js';
import CheckBox    from 'grommet/components/CheckBox.js';

export default class extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      mode: 'timer',

      theme: 'lite',

      onTableMode:    false,
      lookAroundMode: false
    };
  }

  render () {
    return (
      <Form>
        <FormFields style={{marginBottom: '0.5em'}}>
          <FormField label='Date'>
            <DateTime
              format='MM/DD/YYYY'
              value={this.state.date}

              onChange={(date) => {
                if (date.match(/^\d\d\/\d\d\/\d\d\d\d$/)) {
                  this.setState({
                    date: date
                  }, this.renderIFrame);
                }
              }}/>
          </FormField>

          <FormField label='Mode'>
            <RadioButton
              id='timer'
              label='Timer'
              checked={this.state.mode === 'timer'}

              onChange={() => this.setState({
                mode: 'timer'
              }, this.renderIFrame)} />

            <RadioButton
              id='countdown'
              label='Countdown'
              checked={this.state.mode === 'countdown'}

              onChange={() => this.setState({
                mode: 'countdown'
              }, this.renderIFrame)} />
          </FormField>
        </FormFields>

        <FormFields style={{marginBottom: '0.5em'}}>
          <FormField label='Theme'>
            <RadioButton
              id='lite'
              label='Light'
              checked={this.state.theme === 'lite'}

              onChange={() => this.setState({
                theme: 'lite'
              }, this.renderIFrame)} />

            <RadioButton
              id='dark'
              label='Dark'
              checked={this.state.theme === 'dark'}

              onChange={() => this.setState({
                theme: 'dark'
              }, this.renderIFrame)} />
          </FormField>
        </FormFields>

        <FormFields style={{marginBottom: '0.5em'}}>
          <FormField>
            <CheckBox
              label='"On Table" mode'
              checked={this.state.onTableMode}

              onChange={() => this.setState({
                onTableMode: !this.state.onTableMode
              }, this.renderIFrame)} />
          </FormField>

          <FormField>
            <CheckBox
              label='"Look Around" mode'
              checked={this.state.lookAroundMode}

              onChange={() => this.setState({
                lookAroundMode: !this.state.lookAroundMode
              }, this.renderIFrame)} />
          </FormField>
        </FormFields>
      </Form>
    );
  }

  renderIFrame () {
    const props = Object.keys(this.state).map((key) => `${key}=${this.state[key]}`).join('&');
    const url = `./timeglass-3d.html?${props}`;

    const iframeNode = document.querySelector('#iframe');

    iframeNode.style.backgroundImage = ({
      lite: 'linear-gradient(#eeeeee, #ffffff)',
      dark: 'linear-gradient(#555555, #666666)'
    })[this.state.theme];

    iframeNode.src = url;
  }
}

