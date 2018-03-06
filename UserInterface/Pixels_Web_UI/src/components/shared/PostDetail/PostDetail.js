import React, { Component } from 'react';
import Header from '../Header/Header';
import ViewComment from '../Comments/ViewComment/ViewComment.js';
import AddaComment from '../Comments/AddComment/AddaComment';
import Description from '../Description/Description.js';
import Votes from '../Votes/Votes.js';
import './PostDetail.css';


class PostDetail extends Component {
    render() {
        return (
            <div >
                <div className="wrapper">
                    <div className="Mainposts">
                        <div className="PostDetails">
                            <div className="TopicDetails">
                                <div className="Topic">Topic</div>
                                <div className="Topic-content">Farm</div>
                            </div>
                            <div className="UserDetails">
                                <div className="UserName">Posted by</div>
                                <div className="User">Mano</div>
                            </div>
                            <div className="pic">
                                <img src="https:static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                            </div>
                            <Votes />
                            <Description />
                            <ViewComment />
                            <AddaComment />
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default PostDetail;