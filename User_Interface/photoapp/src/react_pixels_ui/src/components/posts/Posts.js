import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import ViewComment from '../shared/Comments/ViewComment/ViewComment.js';
import AddComment from '../shared/Comments/AddComment/AddComment.js';
import Description from '../shared/Description/Description.js';
import Votes from '../shared/Votes/Votes.js';
import PostDetail from '../shared/PostDetail/PostDetail.js';
import VoteIcon from '../posts/Vote_Icon/VoteIcon';
import './Posts.css';
import axios from 'axios';
import ImagesModal from '../ImagesUpload/ImagesModal';

class Posts extends Component {
    state = {
        selectedFile: null,
        UploadedImage: undefined
    }
   
    render() {
        return (
            <div className="posts">
                <div className="post">
                    <div className="posted-by">Vicky</div>
                    <div className="post-pic">
                        <Link to="/post"></Link>

                        <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg" />
                    </div>
                    <Votes />
                    <Description />
                    <ViewComment />
                    <AddComment />
                    </div>
                    <div className="post">
                        <div className="posted-by">Dishen</div>
                        <div className="post-pic">
                            <img src="http:amrosenow7barz.s3.amazonaws.com/farm.jpg" />
                        </div>
                        <Votes />
                        <Description />
                        <ViewComment />
                        <AddComment />
                    </div>
                 </div >
            );
    }
}


export default Posts;