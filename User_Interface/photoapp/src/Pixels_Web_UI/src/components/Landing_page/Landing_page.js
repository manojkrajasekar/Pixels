import React, { Component } from 'react';
import Posts from '../posts/Posts.js';
import Bestfind from '../Bestfind/Bestfind.js';
import Topics from '../shared/Topics/Topics.js';
import './Landing_page.css';

class Landing_page extends Component {
    render() {
        return (
            <div className="Landing_page">
                <Bestfind />
                <Posts />
                <Topics />
            </div>
        );
    }
}

export default Landing_page;