import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import AddaComment from '../shared/Comments/AddComment/AddaComment';
import CommentsList from '../CommentsList/CommentsList';
import CommentsListItem from '../CommentsList/CommentsListItem';
import PostCommentsList from '../CommentsList/PostCommentsList';
import './PostsListItem.css';

class PostsListItem extends Component {
    
    GoToUser = () => {
        this.props.history.push('/user');
    }

    GoToPost = () => {
        this.props.history.push('/post')
    }


    render() {
        return (
            <div>
                <div className="posted_by" onClick={this.GoToUser}>
                    {this.props.post_by}
                </div>
                <div className="post-pic" onClick={this.GoToPost}>
                    <img src={this.props.post_URL}/>
                </div>
                <CommentsList />
                <AddaComment postID = {this.props.id}/>
             </div>
        );
    }
}


export default withRouter(PostsListItem);