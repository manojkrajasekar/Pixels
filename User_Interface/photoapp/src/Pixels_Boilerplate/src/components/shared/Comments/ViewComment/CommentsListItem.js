import React from 'react';
import './CommentsListItem.css';

const CommentsListItem = ({ commented_by, comment, commented_on}) => (
    <div className="wrapper">
        <p>{commented_by}</p>   
        <p>{comment}</p>
        <p>{commented_on}</p>   
    </div>
);

export default CommentsListItem;