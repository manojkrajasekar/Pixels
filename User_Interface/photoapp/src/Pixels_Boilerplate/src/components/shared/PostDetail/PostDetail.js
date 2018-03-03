import React, { Component } from 'react';
import Header from '../Header/Header';
import ViewComment from '../Comments/ViewComment/ViewComment.js';
import AddC from '../Comments/AddComment/AddC';
import Description from '../Description/Description.js';
import Votes from '../Votes/Votes.js';
import './PostDetail.css';


class PostDetail extends Component {
    render() {
        return (
            <div >
                <Header />
                    <div className="wrapper">
                        <div className="Mainposts">
                            <div className="PostDetails">
                                <div className="Topic">Farm</div>
                                <div className="By">Manoj</div>
                                <div className="pic">
                                    <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg"/>
                                </div>
                                <Votes />
                                <Description />
                                <ViewComment />
                                <AddC />
                            </div>
                        </div>
                    </div>
                </div>
        );
    }
}

export default PostDetail;