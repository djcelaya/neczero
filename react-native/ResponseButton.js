import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';

const ResponseButton = (props) => {
  // let className="col col-sm col-md-auto col-lg-auto border";
  // if (props.selected) {
  //   className += " bg-info"
  // }
  return (
    // <button className={className} onClick={() => props.handleClick()}>
    //   <p dangerouslySetInnerHTML={{__html: props.text}}></p>
    //   <p>{props.points} points</p>
    // </button>
    <TouchableOpacity style={styles.responseButton} onPress={() => props.handleClick()}>
      <Text>{props.text}</Text>
      <Text>{props.points} points</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  responseButton: {
    width: "5%",
    borderWidth: 1
  }
});

export default ResponseButton;