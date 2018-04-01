import React, { Component } from 'react';
import './PrevTopicDetails.css';
// import './Sample.css';

class PrevTopicDetails extends Component {
    constructor(props){
        super(props);
    }

    render() {
        return (
            <div className="prev-topic-wrapper">
                <div className="prev-topic-title">
                    <div className="topic">Topic</div>
                    <div className="topic-title">Wildlife</div>
                </div>
                <div className="topic-posts">
                    <div className="posts-count">#</div>   
                    <div className="total-posts-number">3412</div>
                </div>
            </div>
        );
    }
}

export default PrevTopicDetails;







