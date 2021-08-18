import React from 'react';
import FormHeader from '../FormHeader';
import Question from '../Question';
import RaceQuestion from '../RaceQuestion';
import OutbornQuestion from '../OutbornQuestion';
import FormFooter from '../FormFooter';
import data from '../../data.json';

export default class Form extends React.Component {
  
  questions = data;

  constructor(props) {
    super(props);
    this.state = {
      racePoints: null,
      outbornPoints: null,
      gestationalAgeResponseID: null,
      raceResponseID: null
    }
  }

  handleRaceResponse(points) {
    this.setState({racePoints: points});
  }

  handleOutbornResponse(points) {
    this.setState({outbornPoints: points});
  }

  calculateTotalPoints() {
    return (
      this.pointsForQuestionResponse('gestationalAge', this.state.gestationalAgeResponseID) +
      this.state.racePoints +
      this.state.outbornPoints
    );
  }

  handleResponseToQuestion(questionID, responseID) {
    switch(questionID) {
      case 'gestationalAge':
        this.setState({gestationalAgeResponseID: responseID});
        break;
      case 'race':
        this.setState({raceResponseID: responseID});
        break;
      default:
        console.log('Unknown questionID encountered when attempting to respond to question.');
    }
  }

  isResponseSelectedForQuestion(questionID, responseID) {
    switch(questionID) {
      case 'gestationalAge':
        return this.state.gestationalAgeResponseID === responseID;
      case 'race':
        return this.state.raceResponseID === responseID;
      default:
        console.log('Unknown questionID encountered when checking response selection.');
    }
  }

  pointsForQuestionResponse(questionID, responseID) {
    let question = this.questions[questionID];
    let response = question.responses[responseID];
    if (response) {
      return response.points
    } else {
      return null;
    }
  }

  render() {
    return (
      <div className="container border">
        <FormHeader />
        <Question
          points={this.pointsForQuestionResponse('gestationalAge', this.state.gestationalAgeResponseID)}
          data={this.questions['gestationalAge']}
          handleResponse={(questionID, responseID) => this.handleResponseToQuestion(questionID, responseID)}
          isSelected={(questionID, responseID) => this.isResponseSelectedForQuestion(questionID, responseID)}
        />
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