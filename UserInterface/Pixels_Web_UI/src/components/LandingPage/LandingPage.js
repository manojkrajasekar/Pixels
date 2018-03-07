import React, { Component } from 'react';
import PostsList from '../posts/PostsList';
import Bestfind from './Bestfind/Bestfind';
import Topics from '../shared/Topics/Topics.js';
import './LandingPage.css';

class Landing_page extends Component {
    render() {
        return (
            <div className="Landing_page">  
                <Bestfind />
                <PostsList />
                <Topics />
            </div>
        );
    }
}

export default Landing_page;