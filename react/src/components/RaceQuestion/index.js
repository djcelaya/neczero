import React from 'react';

export default class RaceQuestion extends React.Component {
  // constructor(props) {
  //   super(props);
  //   this.state = {
  //     points: null
  //   }
  // }

  handleOption1Click() {
    // this.setState({points: 2});
    this.props.handler(2);
  }

  handleOption2Click() {
    // this.setState({points: 2});
    this.props.handler(2);
  }

  handleOption3Click() {
    // this.setState({points: 0});
    this.props.handler(0);
  }

  render() {
    return (
      <div className="row">
        <div className="col-8 border">
          <p>Race (2 max)</p>
          <p>If the infant is either Black or Hispanic race assign 2 points. If both, assign only 2 points. If not Black or hispanic, assign 0 points.</p>
        </div>
        <button className="col-1 border" onClick={() => this.handleOption1Click()}>
          <p>Black</p>
          <p>2<br />points</p>
        </button>
        <button className="col-1 border" onClick={() => this.handleOption2Click()}>
          <p>Hispanic</p>
          <p>2 points</p>
        </button>
        <button className="col-1 border" onClick={() => this.handleOption3Click()}>
          <p>Other races</p>
          <p>0 points</p>
        </button>
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}