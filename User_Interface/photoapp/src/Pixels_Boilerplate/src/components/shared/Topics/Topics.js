import React, { Component } from 'react';
import './Topics.css';
import Availability from './Availability';

class Topics extends Component {
    state = {
        data :[
            {call:'station one',frequency:'000'},
            {call:'station two',frequency:'001'}
        ]
    };

    render() {
        return (
            <div className="Topics">
                <div className="topic-details">
                    <div className="topic-title">Topic</div>
                    <div className="topic-content">WILDLIFE</div>
                </div>
                <div className="topic-details">
                    <div className="available-till">Active till</div>   
                    <div className="time-limit">3rd January, 2018</div>
                </div>
                <div className="previous-topics">
                    <span className="view-topics">View previous topics</span>
                    <span className="view" >&#9655;</span>
                </div>
                <div className="view-previous" >
                    <div className="prev-topic-title">
                        <div className="prev-topic">Topic</div>
                        <div className="prev-title">Dawn</div>
                    </div>
                    <div className="prev-topic-title">
                        <div className="no-of-posts">#posts</div>
                        <div className="number">1234</div>
                    </div>
                    
                    
                    <div className="prev-topic-title">
                        
                    <Availability/>
                    </div>
                </div>
                
            </div>
        );
    }
}

export default Topics;