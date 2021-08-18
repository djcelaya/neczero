import React from 'react';
import FormHeader from '../FormHeader';
import Question from '../Question';
import RaceQuestion from '../RaceQuestion';
import OutbornQuestion from '../OutbornQuestion';
import FormFooter from '../FormFooter';

export default class Form extends React.Component {

  questions = {
    'gestationalAge': {
      id: 'gestationalAge',
      title: 'Gestational age (weeks)',
      subtitle: '(9 max)',
      body: 'Calculate GA in weeks at birth based preferably on due date determined by 1<sup>st</sup> trimester ultrasound. If that is unavailable, use the gestational age assessment at delivery (Ballard or Dubowitz)',
      responses: {
        'gestationalAge1': {
          id: 'gestationalAge1',
          text: '<28',
          points: 9
        },
        'gestationalAge2': {
          id: 'gestationalAge2',
          text: '28-31 6/7',
          points: 8
        },
        'gestationalAge3': {
          id: 'gestationalAge3',
          text: '&#8805; 32',
          points: 0
        }
      }
    },
  };

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

  // getQuestion(questionID) {
  //   return 
  // }

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