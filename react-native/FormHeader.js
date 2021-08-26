import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

const FormHeader = () => {
  return (
    <View style={styles.row}>
    {/* <View> */}
      <Text style={styles.title}>GutCheck<sup>NEC</sup></Text>
      <Text style={styles.points}>Points</Text>
      {/* <StatusBar style="auto" /> */}
    </View>
  );
};

const styles = StyleSheet.create({
  row: {
    flex: 1,
    flexDirection: "row"
  },
  title: {
    // flex: 1
    borderWidth: 1,
    // flexBasis: "100%"
    width: "95%"
  },
  points: {
    borderWidth: 1,
    // flexBasis: "auto"
    width: "5%"
  }
});

export default FormHeader;