import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import ResponseButton from './ResponseButton';

const Question = (props) => {
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
  return(
    <View style={styles.row}>
      <View style={styles.questionContainer}>
        <Text style={styles.questionTitle}>{props.data.title + ' ' + props.data.subtitle}</Text>
        <Text style={styles.questionText}>{props.data.body}</Text>
      </View>
      {responseButtons}
      <View style={styles.points}>{props.points}</View>
    </View>
  );
};

const styles = StyleSheet.create({
  row: {
    flex: 1,
    flexDirection: "row"
  },
  questionContainer: {
    // flex: 1
    borderWidth: 1,
    width: "75%"
  },
  questionTitle: {
    fontWeight: "bold"
  },
  points: {
    borderWidth: 1,
    width: "5%"
  }
});

export default Question;