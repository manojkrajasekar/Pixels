import React, { Component } from 'react';
import VoteIcon from '../../posts/Vote_Icon/VoteIcon';
import './Votes.css';
class Votes extends Component {
    constructor(props){
        super(props);
        this.state = {
            TotalCount: 1
        };
    }
    onCount = (count) => {
            this.setState({
                TotalCount: count
            });
    };
    
    render() {
        return (
            <div className="vote">
                <VoteIcon Increasecount={this.onCount.bind(this)} />
                <div className="Wrapped-vote-count">
                    <div className="votecount">
                    {this.state.TotalCount}
                    </div>
                    <div className="votes">
                        votes
                    </div> 
                </div>
            </div>
        );
    }
}

export default Votes;