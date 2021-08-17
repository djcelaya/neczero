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
      points: null
    }
  }

  render() {
    return (
      <div className="container border">
        <FormHeader />
        <GestationalAgeQuestion />
        <RaceQuestion />
        <OutbornQuestion />
        <FormFooter points={this.state.points} />
      </div>
    );
  }
}