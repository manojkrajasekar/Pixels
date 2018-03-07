import React, { Component } from 'react';
import './UserPosts.css';

class UserPosts extends Component {
    render() {
        return (
            <div className="user-posts">
                <div className="post">
                    <div className="post-pic">
                        <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                    </div>
                    <div className="voteCount">2300
                            <span className="votes">votes</span>
                    </div>
                </div>
                <div className="post">
                    <div className="post-pic">
                        <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                    </div>
                    <div className="voteCount">1250
                            <span className="votes">votes</span>
                    </div>
                </div>
            </div>
        );
    }
}

export default UserPosts;