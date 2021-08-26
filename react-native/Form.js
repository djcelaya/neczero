import React, { Component } from 'react';
import { View } from 'react-native';
import FormHeader from './FormHeader';
import Question from './Question';
import FormFooter from './FormFooter';
import data from './data.json';

class Form extends Component {

  questions = data;

  constructor(props) {
    super(props);
    this.state = {
      gestationalAgeResponseID: null,
      raceResponseID: null,
      outbornResponseID: null,
      necRateResponseID: null,
      milkResponseID: null,
      probioticsResponseID: null,
      infectionsResponseID: null,
      transfusionResponseID: null,
      hypotensionResponseID: null,
      metabolicAcidosisResponseID: null
    }
  }

  calculateTotalPoints() {
    let totalPoints = null;
    for (const questionID in this.questions) {
      let stateResponseID = this.state[questionID+'ResponseID']
      let questionPoints = this.pointsForResponse(questionID, stateResponseID);
      if (questionPoints != null) {
        totalPoints += questionPoints
      }
    }
    return totalPoints;
  }

  handleResponseToQuestion(questionID, responseID) {
    let newState = {};
    let stateResponseID = questionID + 'ResponseID';
    newState[stateResponseID] = responseID;
    this.setState(newState);
  }

  isResponseSelected(questionID, responseID) {
    return this.state[questionID+'ResponseID'] === responseID;
  }

  pointsForResponse(questionID, responseID) {
    let question = this.questions[questionID];
    let response = question.responses[responseID];
    if (response) {
      return response.points
    } else {
      return null;
    }
  }

  render() {
    let questionRows = Object.keys(this.questions).map((questionID) => {
      let question = this.questions[questionID];
      return (
        <Question
          key={questionID}
          data={question}
          handleResponse={(responseID) => this.handleResponseToQuestion(questionID, responseID)}
          isSelected={(responseID) => this.isResponseSelected(questionID, responseID)}
          points={this.pointsForResponse(questionID, this.state[questionID+'ResponseID'])} />
      );
    });
    return (
      <View style={style}>
        <FormHeader />
        {questionRows}
        <FormFooter points={this.calculateTotalPoints()} />
      </View>
    );
  }
}

const style = {
  // display: "flex",
  // flexWrap: "wrap",
  borderWidth: 1
};

export default Form;