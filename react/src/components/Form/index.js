import React from 'react';
import FormHeader from '../FormHeader';
import GestationalAgeQuestion from '../GestationalAgeQuestion';
import RaceQuestion from '../RaceQuestion';
import OutbornQuestion from '../OutbornQuestion';
import FormFooter from '../FormFooter';

export default class Form extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      gestationAgePoints: null,
      racePoints: null,
      outbornPoints: null,
      // totalPoints: null
    }
  }

  handleGestationAgeResponse(points) {
    this.setState({gestationAgePoints: points});
  }

  handleRaceResponse(points) {
    this.setState({racePoints: points});
  }

  handleOutbornResponse(points) {
    this.setState({outbornPoints: points});
  }

  calculateTotalPoints() {
    return (
      this.state.gestationAgePoints +
      this.state.racePoints +
      this.state.outbornPoints
    );
  }

  render() {
    return (
      <div className="container border">
        <FormHeader />
        <GestationalAgeQuestion
          points={this.state.gestationAgePoints}
          handler={(points) => this.handleGestationAgeResponse(points)} />
        <RaceQuestion
          points={this.state.racePoints}
          handler={(points) => this.handleRaceResponse(points)} />
        <OutbornQuestion
          points={this.state.outbornPoints}
          handler={(points) => this.handleOutbornResponse(points)} />
        <FormFooter points={this.calculateTotalPoints()} />
      </div>
    );
  }
}