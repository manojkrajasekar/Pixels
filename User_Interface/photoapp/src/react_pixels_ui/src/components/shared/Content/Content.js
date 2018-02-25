import React, { Component } from 'react';
import Header from '../../shared/Header/Header.js';
// import Posts from '../../posts/Posts.js';
// import Bestfind from '../../Bestfind/Bestfind.js';
import Landing_page from '../../Landing_page/Landing_page.js';
import './Content.css';

class Content extends Component {
    render() {
        return (
            <div>
                <Header />
                <Landing_page />
            </div>
            
        );
    }
}

export default Content;