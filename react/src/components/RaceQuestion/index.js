import React from 'react';
import ResponseButton from '../ResponseButton';

export default class RaceQuestion extends React.Component {
  
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
    this.props.handler(2);
    this.clearSelected()
    this.setState({response1Selected: true});
  }

  handleOption2Click() {
    this.props.handler(2);
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
          <h6>Race (2 max)</h6>
          <p>If the infant is either Black or Hispanic race assign 2 points. If both, assign only 2 points. If not Black or hispanic, assign 0 points.</p>
        </div>
        <ResponseButton
          text="Black"
          points="2 points"
          selected={this.state.response1Selected}
          handleClick={() => this.handleOption1Click()} />
        <ResponseButton
          text="Hispanic"
          points="2 points"
          selected={this.state.response2Selected}
          handleClick={() => this.handleOption2Click()} />
        <ResponseButton
          text="Other races"
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