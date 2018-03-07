import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import UserPosts from './UserPosts/UserPosts';
import UserDetails from './UserDetails/UserDetails';
import UserDetailsLayout from './UserDetails/UserDetailsLayout/UserDetailsLayout';
import { withRouter } from 'react-router-dom';
import './UserProfile.css';

class UserProfile extends Component {
    render() {
        return (
            <div className="UserPage">
                <div className="UserPosts">
                    <UserDetails />
                    <UserPosts />
                </div>
            </div>
        );
    }
}

export default UserProfile;