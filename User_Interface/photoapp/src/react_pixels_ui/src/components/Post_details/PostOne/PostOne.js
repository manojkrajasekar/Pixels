import React, { Component } from 'react';
import ViewComment from '../../shared/Comments/ViewComment/ViewComment.js';
import AddComment from '../../shared/Comments/AddComment/AddComment.js';
import './PostOne.css';

class PostOne extends Component {
    render() {
        return (
            <div className="posts">
                <div className="post"> 
                    <div className="show-posts">
                        Topic
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
                    <span className="posted-on">
                        Posted on:
                    </span>
                    <span className="posted-time">
                        May 5, 2018
                    </span>
                    <div className="Description">
                        <span className="Description-of-post">
                            Description
                        </span>
                        <span className="Description-content">
                            Glad that, didn't miss this shot !
                        </span>
                    </div>
                    <ViewComment />
                    <AddComment />
                </div>
            </div>
        );
    }
}

export default PostOne;