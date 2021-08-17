import React from 'react';

export default class FormFooter extends React.Component {
  render() {
    return (
      <div className="row">
        <div className="col-11 border">
          <p><b>Score by 72 hours of life then q12-24 hrs. Rescore if new risk factor added and at 7, 14, 21, and 28 days of age. Low risk= &#60;20 points, Moderate risk= 20-32 points, High risk= 33-36 points, Very high risk &#62; 36 points</b>  (especially at 72 hours of age). Scores typically range from 8-58 points.</p>
        </div>
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}