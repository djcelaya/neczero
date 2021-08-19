import React from 'react';
import ResponseButton from '../ResponseButton';

export default function Question(props) {
  let question = props.data;
  let responses = question.responses;
  let responseButtons = Object.keys(responses).map((responseID) => {
    let response = question.responses[responseID];
    return (
      <ResponseButton
        key={responseID}
        text={response.text}
        points={response.points}
        handleClick={() => props.handleResponse(responseID)}
        selected={props.isSelected(responseID)}
      />
    );
  });
  return (
    <div className="row">
      <div className="col-xs-12 col-sm-12 col-md border">
        <h6>{props.data.title + ' ' + props.data.subtitle}</h6>
        <p dangerouslySetInnerHTML={{__html: props.data.body}}></p>
      </div>
      {responseButtons}
      <div className="d-none d-md-block col-md-1 border">
        <p>{props.points}</p>
      </div>
    </div>
  );
}