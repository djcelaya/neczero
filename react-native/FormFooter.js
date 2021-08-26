import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

const instructions = `Score by 72 hours of life then q12-24 hrs. Rescore if new risk factor added and at 7, 14, 21, and 28 days of age. Low risk= <20 points, Moderate risk= 20-32 points, High risk= 33-36 points, Very high risk > 36 points</b>  (especially at 72 hours of age). Scores typically range from 8-58 points.`;

const FormFooter = (props) => {
  return (
    <View style={styles.row}>
      <Text style={styles.instructions}>{instructions}</Text>
      <Text style={styles.score}>{props.points}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  row: {
    flex: 1,
    flexDirection: "row"
  },
  instructions: {
    // flex: 1
    borderWidth: 1,
    width: "95%"
  },
  score: {
    borderWidth: 1,
    width: "5%"
  }
});

export default FormFooter;