import React from 'react';

export default class FormHeader extends React.Component {
  render() {
    return (
      <div className="row">
        <div className="col-11 border">
          <h1>GutCheck<sup>NEC</sup></h1>
        </div>
        <div className="col-1 border">
          <b>Points</b>
        </div>
      </div>
    );
  }
}