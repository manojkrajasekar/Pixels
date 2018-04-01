import React, { Component } from 'react';
import CommentsList from './CommentsList';
import CommentsListItem from './CommentsListItem';
import CommentsListCheck from './CommentsListCheck';

class PostCommentsList extends Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div>
                
                <CommentsListCheck post_id_all = {this.props.postID}/>
            </div>
        );
    }
}

export default PostCommentsList;