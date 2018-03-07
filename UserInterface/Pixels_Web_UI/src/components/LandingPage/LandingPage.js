import React, { Component } from 'react';
import ViewPosts from '../posts/ViewPosts';
import Bestfind from './Bestfind/Bestfind';
import Topics from '../shared/Topics/Topics.js';
import './LandingPage.css';

class Landing_page extends Component {
    render() {
        return (
            <div className="Landing_page">  
                <Bestfind />
                <ViewPosts />
                <Topics />
            </div>
        );
    }
}

export default Landing_page;