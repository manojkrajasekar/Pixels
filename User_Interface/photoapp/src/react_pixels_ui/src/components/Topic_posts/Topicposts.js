import React, { Component } from 'react';
import Header from '../shared/Header/Header.js';
import Posts_topic from './Posts_by_topic/Posts_topic.js';
import Topics from '../shared/Topics/Topics.js'; 
import LeftSpace from '../shared/LeftSpace/LeftSpace.js';
import './Topicpost.css';

class Topicposts extends Component {
    render() {
        return (
            <div>
                <Header />
                <div className="Topicposts">
                    <LeftSpace />
                    <Posts_topic />
                    <Topics />
                </div>
            </div>
        );
    }
}

export default Topicposts;
