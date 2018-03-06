import React, { Component } from 'react';
import Posts from '../posts/Posts';
import Header from '../shared/Header/Header';

class PostsByTopic extends Component {
    render() {
        return (
            <div>
              <Posts />
            </div>
        );
    }
}

export default PostsByTopic;