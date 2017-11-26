import React from 'react';

export default (props) => {
  const tab = props.content.search(/[^\s]/) - 1;

  return (
    <pre style={{margin: 0, padding: '1em', background: 'rgba(0, 0, 0, 0.02)'}}>
      {props.content.split('\n').map((line) => line.slice(tab)).join('\n').trim()}
    </pre>
  );
}

