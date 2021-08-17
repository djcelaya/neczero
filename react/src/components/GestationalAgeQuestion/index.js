import React from 'react';

export default class GestationalAgeQuestion extends React.Component {

  // constructor(props) {
  //   super(props);
  //   this.state = {
  //     points: null
  //   }
  // }

  handleOption1Click() {
    // this.setState({points: 9});
    this.props.handler(9);
  }

  handleOption2Click() {
    // this.setState({points: 8});
    this.props.handler(8);
  }

  handleOption3Click() {
    // this.setState({points: 0});
    this.props.handler(0);
  }

  render() {
    return (
      <div className="row">
        <div className="col-8 border">
          <p>Gestational age (weeks) (9 max.)</p>
          <p>Calculate GA in weeks at birth based preferably on due date determined by 1<sup>st</sup> trimester ultrasound. If that is unavailable, use the gestational age assessment at delivery (Ballard or Dubowitz)</p>
        </div>
        <button className="col-1 border" onClick={() => this.handleOption1Click()}>
          <p>&#60;28</p>
          <p>9<br />points</p>
        </button>
        <button className="col-1 border" onClick={() => this.handleOption2Click()}>
          <p>28-31 6/7</p>
          <p>8 points</p>
        </button>
        <button className="col-1 border" onClick={() => this.handleOption3Click()}>
          <p>&#8805; 32</p>
          <p>0 points</p>
        </button>
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}