import React from 'react';

import Form       from 'grommet/components/Form.js';
import FormFields from 'grommet/components/FormFields.js';
import FormField  from 'grommet/components/FormField.js';

import CheckBox    from 'grommet/components/CheckBox.js';
import DateTime    from 'grommet/components/DateTime.js';
import RadioButton from 'grommet/components/RadioButton.js';

export default (props) =>
  <Form>
    <FormFields style={{marginBottom: '0.5em'}}>
      <FormField label='Date'>
        <DateTime format='MM/DD/YYYY' value={props.date} onChange={(date) => props.onChange({date: date})} />
      </FormField>

      <FormField label='Mode'>
        <RadioButton
            id='timer'
            label='Timer'
            checked={props.mode === 'timer'}
            onChange={() => props.onChange({mode: 'timer'})} />

        <RadioButton
            id='countdown'
            label='Countdown'
            checked={props.mode === 'countdown'}
            onChange={() => props.onChange({mode: 'countdown'})} />

      </FormField>
    </FormFields>

    <FormFields style={{marginBottom: '0.5em'}}>
      <FormField label='Theme'>
        <RadioButton
            id='lite'
            label='Light'
            checked={props.theme === 'lite'}
            onChange={() => props.onChange({theme: 'lite'})} />

        <RadioButton
            id='dark'
            label='Dark'
            checked={props.theme === 'dark'}
            onChange={() => props.onChange({theme: 'dark'})} />

      </FormField>
    </FormFields>

    <FormFields>
      <FormField>
        <CheckBox
            label='"On Table" mode'
            checked={props.onTableMode}
            onChange={() => props.onChange({onTableMode: !props.onTableMode})} />

      </FormField>

      <FormField>
        <CheckBox
            label='"Look Around" mode'
            checked={props.lookAroundMode}
            onChange={() => props.onChange({lookAroundMode: !props.lookAroundMode})} />

      </FormField>
    </FormFields>
  </Form>

