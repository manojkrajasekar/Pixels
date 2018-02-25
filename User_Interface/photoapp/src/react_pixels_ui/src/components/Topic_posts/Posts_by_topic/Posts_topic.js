import React, { Component } from 'react';
import './Posts_topic.css';

class Posts_topic extends Component {
    render() {
        return (
            <div className="posts">
                <div className="post"> 
                    <div className="show-posts">
                        Showing posts for topic
                        <span className="show-topic">Farm</span>
                    </div>
                    <div className="posted-by">
                        Vicky
                    </div>
                    <div className="post-pic">
                            <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                    </div>
                    <span className="votecount">
                        2100
                    </span>
                    <span className="votes">
                        votes
                    </span> 
                    <div className="Description">
                        <span className="user">
                            Vicky:
                        </span>
                        <span className="Description-content">
                            Glad that, I didn't miss this shot !
                        </span>
                        <div className="posted-time">
                            May 5, 2018
                        </div>
                    </div>
                </div>
                <div className="post">
                    <div className="posted-by">Dishen</div>
                    <div className="post-pic">
                            <img src="http://camrosenow7barz.s3.amazonaws.com/farm.jpg"/>
                    </div>
                    <span className="votecount">
                        1200
                    </span>
                    <span className="votes">
                        votes
                    </span> 
                    <div className="Description">
                        <span className="user">
                            Vicky:
                        </span>
                        <span className="Description-content">
                            Glad that, I didn't miss this shot !
                        </span>
                        <div className="posted-time">
                            20 hours ago
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Posts_topic;