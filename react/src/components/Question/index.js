import React from 'react';
import ResponseButton from '../ResponseButton';

export default class Question extends React.Component {
  render() {
    let question = this.props.data;
    let responses = question.responses;
    let responseButtons = Object.keys(responses).map((responseID) => {
      let response = question.responses[responseID];
      return (
        <ResponseButton
          key={response.id}
          text={response.text}
          points={response.points}
          handleClick={() => this.props.handleResponse(this.props.data.id, response.id)}
          selected={this.props.isSelected(this.props.data.id, response.id)}
        />
      );
    });
    let numResponses = Object.keys(responses).length;
    let questionColumnWidth = 12 - 1 - numResponses;
    return (
      <div className="row">
        <div className={"col-" + questionColumnWidth + " border"}>
          <h6>{this.props.data.title + ' ' + this.props.data.subtitle}</h6>
          <p dangerouslySetInnerHTML={{__html: this.props.data.body}}></p>
        </div>
        {responseButtons}
        <div className="col-1 border">
          <p>{this.props.points}</p>
        </div>
      </div>
    );
  }
}