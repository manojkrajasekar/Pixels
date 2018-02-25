import React, { Component } from 'react';
import './AddComment.css';

class AddComment extends Component {
    render() {
        return (
            <div>
                <input className="add-comment"
                    type="text"
                    placeholder="Add a comment..." 
                />
            </div>
        );
    }
}

export default AddComment;