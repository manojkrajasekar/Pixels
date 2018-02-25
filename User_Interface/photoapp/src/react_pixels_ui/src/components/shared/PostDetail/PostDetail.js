import React, { Component } from 'react';
import ViewComment from '../Comments/ViewComment/ViewComment.js';
import AddComment from '../Comments/AddComment/AddComment.js';
import Description from '../Description/Description.js';
import Votes from '../Votes/Votes.js';
import './PostDetail.css';


class PostDetail extends Component {
    render() {
        return (
            <div className="Mainposts">
                <div className="PostDetails">
                    <div className="By"></div>
                    <div className="pic">
                        <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                    </div>
                    <Votes />
                    <Description />
                    <ViewComment />
                    <AddComment />
                </div>
            </div>
        );
    }
}

export default PostDetail;