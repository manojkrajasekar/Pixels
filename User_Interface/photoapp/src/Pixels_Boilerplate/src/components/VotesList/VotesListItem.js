import React from 'react';
import './VotesListItem.css';

const VotesListItem = ( props ) => (
    <div>
        {props.votes.count ? <p className="voteStyle">1 VOTE</p>: <p className="voteStyle">O VOTE</p> }
    </div>
);

export default VotesListItem;