import React from 'react';

export default class FormHeader extends React.Component {
  render() {
    return (
      <div className="row">
        <div className="col border">
          <h1>GutCheck<sup>NEC</sup></h1>
        </div>
        <div className="d-none d-md-block col-md-1 border">
          <b>Points</b>
        </div>
      </div>
    );
  }
}