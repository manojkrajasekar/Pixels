import React, { Component } from 'react';
import PrevTopicDetails from '../../PrevTopicDetails/PrevTopicDetails';
import './Topics.css';

class Topics extends Component {
    state = {
        showPreviousTopic: false
    };

    showPreviousTopic = () => {
        this.setState({
            showPreviousTopic:!this.state.showPreviousTopic
        })
    }

    render() {
        return (
            <div className="Topics">
                <div className="topic-details">
                    <div className="topic-title">Topic</div>
                    <div className="topic-content">Wildlife</div>
                </div>
                <div className="topic-details">
                    <div className="available-till">Active till</div>   
                    <div className="time-limit">15th January, 2018</div>
                </div>
                <div className="previous-topics" onClick={this.showPreviousTopic}>
                    <span className="view-topics">View previous topic</span>
                    <span className="view" >&#9655;</span>
                </div>
                {this.state.showPreviousTopic && <PrevTopicDetails /> }
            </div>
        );
    }
}

export default Topics;