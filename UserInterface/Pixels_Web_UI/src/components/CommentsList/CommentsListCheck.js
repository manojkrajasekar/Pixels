import React, { Component } from 'react';
import CommentsListItem from '../CommentsList/CommentsListItem';

class CommentsListCheck extends Component {
    constructor(props){
        super(props);
    }
    render() {
        return(
            <div>
                {this.props.post_id_all}
                {this.props.comments.map((comment) => {
                    return <CommentsListItem key={comment.id} {...comment} />
                })}
            </div>
        );
    }
}


export default CommentsListCheck;