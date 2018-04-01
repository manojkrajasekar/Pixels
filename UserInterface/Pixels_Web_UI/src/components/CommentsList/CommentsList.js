import React from 'react';
import { connect } from 'react-redux';
import CommentsListItem from '../CommentsList/CommentsListItem';
import CommentsListCheck from '../CommentsList/CommentsListCheck';

// const CommentsList = (props) => (
//      <div>
//          <div>
//             {props.comments.map((comment) => {
//              return <CommentsListItem key={comment.id}  {...comment} />
//             })}
//          </div>
//      </div>
// );

// const mapStateToProps = (state) => {
//     return {
//         comments:state.comments
//     };
// };

//  export default connect(mapStateToProps)(CommentsList);


//  const CommentsList = (props) => (
//     <div>
//         <div>
//             {props.comments.map((comment) => {
//                 return <CommentsListItem key={comment.id} {...comment} />
//             })}
//         </div>
//     </div>
// );

const CommentsList = (props) => (
        <div>
            <CommentsListCheck comments = {props.comments}/>
        </div>
    );
1
const mapStateToProps = (state) => {
    return {
       comments:state.comments,
       posts:state.posts
    };
};

export default connect(mapStateToProps)(CommentsList);
 
