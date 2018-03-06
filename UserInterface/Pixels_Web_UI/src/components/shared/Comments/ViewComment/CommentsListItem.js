import React from 'react';
import './CommentsListItem.css';

const CommentsListItem = ({ commented_by, comment, commented_on}) => (
    <div className="wrapper">
        <p className="commented_by">{commented_by}</p>   
        <p className="comment_content">{comment}</p>
        <p>{commented_on}</p>   
    </div>
);

export default CommentsListItem;