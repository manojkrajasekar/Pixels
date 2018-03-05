import React, { Component } from 'react';
import './ViewComment.css';

class ViewComment extends Component {
    render() {
        return (
            <div className="comments">
                <div className="comment">
                    <span className="commented-by">Mike</span>
                    <span className="comment-content">Cool pic dude !</span>
                </div>
                <div className="comment">
                    <span className="commented-by">Reese</span>
                    <span className="comment-content">Interesting</span>
                </div>
                <div className="view-comments">View all comments</div> 
            </div>
        );
    }
}

export default ViewComment;