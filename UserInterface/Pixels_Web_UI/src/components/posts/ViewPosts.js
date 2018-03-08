import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Header from '../Layout/Header/Header';
import ViewComment from '../shared/Comments/ViewComment/ViewComment.js';
import AddaComment from '../shared/Comments/AddComment/AddaComment';
import Description from '../shared/Description/Description.js';
import Votes from '../shared/Votes/Votes.js';
import PostDetail from '../shared/PostDetail/PostDetail.js';
import VoteIcon from '../posts/Vote_Icon/VoteIcon';
import CommentIcon from '../shared/Comments/CommentIcon/CommentIcon';
import CommentsList from '../CommentsList/CommentsList';
import CommentsListItem from '../CommentsList/CommentsListItem';
import VotesList from '../../components/VotesList/VotesList';
import PostsList from '../../components/PostsList/PostsList';
import { DeleteComment } from '../../actions/commentsAction';
import store from '../../store/configureStore';
import './ViewPosts.css';
import { AddPost } from '../../actions/postsAction';

store.dispatch(AddPost({post_by:'Manoj', post_URL:'https:static.pexels.com/photos/161889/mill-car-flour-history-161889.jpeg'}));
console.log(store.getState());

class ViewPosts extends Component {

    GoToUser = () => {
        this.props.history.push('/user');
    }

    GoToPost = () => {
        this.props.history.push('/post')
    }

    render() {
        const { params } = this.props.match;

        return (
            <div className="posts">
                 <h1>{params.id}</h1>
                 <PostsList />
                 <div className="post">
                     <div className="UserInteraction">
                        <Votes />
                        <CommentIcon />
                     </div>
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
            </div>
        );
    }
}


export default withRouter(ViewPosts);