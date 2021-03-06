import React from 'react';
import { connect } from 'react-redux';
import { DeleteComment } from '../../actions/commentsAction';
import './CommentsListItem.css';

const CommentsListItem = ({dispatch, id, commented_by, comment, commented_on, post_id }) => (
    <div>
        <div className="wrapper">
                <div className="commented_by">{commented_by}</div>   
                <div className="comment_content">{comment}</div>
                <div className="commented_on">{commented_on}</div>  
                
                <div className="Delete_Comment"
                        type= "submit"
                        name="Delete" 
                        value="Delete Comment"
                        onClick={ () => {dispatch(DeleteComment({ id }));
                        }} 
                    >Delete
                </div>
        </div>
    </div>
);

export default connect()(CommentsListItem);