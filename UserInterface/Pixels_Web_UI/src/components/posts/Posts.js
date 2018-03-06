import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Header from '../shared/Header/Header';
import ViewComment from '../shared/Comments/ViewComment/ViewComment.js';
import AddaComment from '../shared/Comments/AddComment/AddaComment';
import Description from '../shared/Description/Description.js';
import Votes from '../shared/Votes/Votes.js';
import PostDetail from '../shared/PostDetail/PostDetail.js';
import VoteIcon from '../posts/Vote_Icon/VoteIcon';
import './Posts.css';
import CommentsList from '../CommentsList/CommentsList';
import DeleteCommentsList from '../CommentsList/DeleteCommentsList';
import VotesList from '../../components/VotesList/VotesList';
import { DeleteComment } from '../../actions/comments';
import store from '../../store/configureStore';
// import { AddComment } from '../../actions/comments';

//import axios from 'axios';
//import ImagesModal from '../ImagesUpload/ImagesModal';

class Posts extends Component {
    
    GoToUser = () => {
        this.props.history.push('/user');
    }

    GoToPost = () => {
        this.props.history.push('/post')
    }
   
    render() {
        return (
            <div>
                <div className="posts">
                    <div className="post">
                        <div className="posted_by" onClick={this.GoToUser}>
                            Vicky
                        </div>
                        <div className="post-pic" onClick={this.GoToPost}>
                            <img src="https://static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg" />
                        </div>
                        <Votes />
                        <Description />
                        <CommentsList />
                        <AddaComment />
                    </div>
                    <div className="post">
                        <div className="posted_by">Dishen</div>
                        <div className="post-pic">
                            <img src="http:amrosenow7barz.s3.amazonaws.com/farm.jpg" />
                        </div>
                        <Votes />
                        <Description />
                        <ViewComment />
                    </div>
                </div >
            </div>
        );
    }
}


export default withRouter(Posts);