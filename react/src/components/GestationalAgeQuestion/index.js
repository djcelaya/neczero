import React from 'react';
import ResponseButton from '../ResponseButton';

export default class GestationalAgeQuestion extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      response1Selected: false,
      response2Selected: false,
      response3Selected: false
    }
  }

  clearSelected() {
    this.setState({
      response1Selected: false,
      response2Selected: false,
      response3Selected: false
    });
  }

  handleOption1Click() {
    this.props.handler(9);
    this.clearSelected()
    this.setState({response1Selected: true});
  }

  handleOption2Click() {
    this.props.handler(8);
    this.clearSelected()
    this.setState({response2Selected: true});
  }

  handleOption3Click() {
    this.props.handler(0);
    this.clearSelected()
    this.setState({response3Selected: true});
  }

  render() {
    return (
      <div className="row">
        <div className="col-8 border">
          <h6>Gestational age (weeks) (9 max.)</h6>
          <p>Calculate GA in weeks at birth based preferably on due date determined by 1<sup>st</sup> trimester ultrasound. If that is unavailable, use the gestational age assessment at delivery (Ballard or Dubowitz)</p>
        </div>
        <ResponseButton
          text="&#60;28"
          points="9 points"
          selected={this.state.response1Selected}
          handleClick={() => this.handleOption1Click()} />
        <ResponseButton
          text="28-31 6/7"
          points="8 points"
          selected={this.state.response2Selected}
          handleClick={() => this.handleOption2Click()} />
        <ResponseButton
          text="&#8805; 32"
          points="0 points"
          selected={this.state.response3Selected}
          handleClick={() => this.handleOption3Click()} />
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}