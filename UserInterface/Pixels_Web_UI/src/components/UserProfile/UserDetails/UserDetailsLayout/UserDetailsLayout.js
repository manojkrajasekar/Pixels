import React, { Component } from 'react';
import UserDetails from '../UserDetails.js';
import './UserDetailsLayout.css';

class UserDetailsLayout extends Component {
    render() {
        return (
            <div className="Main-Content">
                <UserDetails />
            </div>
        );
    }
}

export default UserDetailsLayout;