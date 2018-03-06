import React from 'react';
import { connect } from 'react-redux';
import VotesListItem from './VotesListItem';

const VotesList = (props) => (
    <div>
        <div>
            
            <VotesListItem {...props}/>
            
        </div>
    </div>
);

const mapStateToProps = (state) => {
    return {
        votes: state.votes
    };
} ;

export default connect(mapStateToProps)(VotesList);