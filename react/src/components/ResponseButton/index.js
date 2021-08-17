import React from 'react';

export default class ResponseButton extends React.Component {
  render() {
    let className = "col-1 border";
    if (this.props.selected) {
      className += " bg-info"
    }
    return (
      <button className={className} onClick={() => this.props.handleClick()}>
        <p>{this.props.text}</p>
        <p>{this.props.points}</p>
      </button>
    );
  }
}