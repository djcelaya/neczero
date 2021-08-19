import React from 'react';

export default function ResponseButton(props) {
  let className="col col-sm col-md-auto col-lg-auto border";
  if (props.selected) {
    className += " bg-info"
  }
  return (
    <button className={className} onClick={() => props.handleClick()}>
      <p dangerouslySetInnerHTML={{__html: props.text}}></p>
      <p>{props.points} points</p>
    </button>
  );
}