import React from 'react';
import { connect } from 'react-redux';
import CommentsListItem from '../CommentsList/CommentsListItem';

const CommentsList = (props) => (
     <div>
         <div>
            {props.comments.map((comment) => {
             return <CommentsListItem key={comment.id}  {...comment} />
            })}
         </div>
     </div>
);

const mapStateToProps = (state) => {
    return {
        comments:state.comments
    };
};

 export default connect(mapStateToProps)(CommentsList);

 