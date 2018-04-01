import React, { Component } from 'react';
import './AddaComment.css';
import moment from 'moment';
import store from '../../../../store/configureStore'
import { AddComment } from '../../../../actions/commentsAction';

class AddaComment extends Component {
    constructor(props){
        super(props);
        this.state = {
            content: '',
            commented_on: moment().format()
        };
    }
    
    onComment = (e) => {
            const content = e.target.value;
            this.setState({
                content: content,
                commented_on: moment().format('LLL')
            });
        };

      Done = (e) => {
          e.preventDefault();
          store.dispatch(AddComment({ comment:this.state.content, commented_on: this.state.commented_on, post_id: this.props.postID})); 
        
           this.setState({
               content: ''
           })
      };

    render() {
        return (
            <div>
                <form className="TypeComment" onSubmit={this.Done}> 
                    <input
                        type="text" 
                        placeholder="Add comment"
                        value={this.state.content}
                        onChange={this.onComment}
                    />
                </form>
            </div>
        );
    }
}

export default AddaComment;