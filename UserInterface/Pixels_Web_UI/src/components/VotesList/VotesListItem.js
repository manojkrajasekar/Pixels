import React from 'react';
import './VotesListItem.css';

const VotesListItem = ( props ) => (
    <div>
        {props.votes.count ? <p className="voteStyle">1 vote</p>: <p className="voteStyle">0 vote</p> }
    </div>
);

export default VotesListItem;