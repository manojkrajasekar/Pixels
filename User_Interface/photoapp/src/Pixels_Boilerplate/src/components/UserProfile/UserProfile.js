import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import Header from '../shared/Header/Header.js';
import UserPosts from '../UserPosts/UserPosts';
import UserDetails from '../shared/UserDetails/UserDetails';
import UserDetailsLayout from '../shared/UserDetails/UserDetailsLayout/UserDetailsLayout.js';
import { withRouter } from 'react-router-dom';
import './UserProfile.css';

class UserProfile extends Component {
    render() {
        return (
            <div className="UserPage">
                <Header />
                <div className="Content">
                    <UserDetails />
                    <UserPosts />
                </div>
            </div>
        );
    }
}

export default UserProfile;