import React from 'react';
import ResponseButton from '../ResponseButton';

export default class OutbornQuestion extends React.Component {
  
  constructor(props) {
    super(props);
    this.state = {
      response1Selected: false,
      response2Selected: false
    }
  }

  clearSelected() {
    this.setState({
      response1Selected: false,
      response2Selected: false
    });
  }

  handleOption1Click() {
    this.props.handler(3);
    this.clearSelected()
    this.setState({response1Selected: true});
  }

  handleOption2Click() {
    this.props.handler(0);
    this.clearSelected();
    this.setState({response2Selected: true});
  }

  render() {
    return (
      <div className="row">
        <div className="col-9 border">
          <h6>Outborn (3 max)</h6>
          <p>If the infant is transferred into this center from another hospital at any time after birth, assign 3 points.</p>
        </div>
        <ResponseButton
          text="Yes"
          points="3 points"
          selected={this.state.response1Selected}
          handleClick={() => this.handleOption1Click()} />
        <ResponseButton
          text="No"
          points="0 points"
          selected={this.state.response2Selected}
          handleClick={() => this.handleOption2Click()} />
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}