import React, { Component } from 'react';
// import PostOne from './PostOne/PostOne.js';
import Header from '../shared/Header/Header.js';
import Topics from '../shared/Topics/Topics.js';
import PostDetail from '../shared/PostDetail/PostDetail';
import LeftSpace from '../shared/LeftSpace/LeftSpace.js';

import './PostDetails.css';

class PostDetails extends Component {
    render() {
        return (
            <div>
                <Header />
                <div className="PostDetails">
                    <LeftSpace />
                    <PostDetail />
                    <Topics />
                </div>
            </div>
        );
    }
}

export default PostDetails;