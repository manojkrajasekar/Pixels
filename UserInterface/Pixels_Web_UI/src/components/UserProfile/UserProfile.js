import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import UserPosts from './UserPosts/UserPosts';
import UserDetails from './UserDetails/UserDetails';
import UserDetailsLayout from './UserDetails/UserDetailsLayout/UserDetailsLayout';
import { withRouter } from 'react-router-dom';
import './UserProfile.css';

class UserProfile extends Component {
    constructor(props){
        super(props);
        this.state={
            showvalue: true
        };
    }

    
    render() {
        return (
            <div className="UserPage">
                <div className="UserPostsWrapper">
                    <UserDetails showvalue={this.state.showvalue} />
                    <UserPosts />
                </div>
            </div>
        );
    }
}

export default UserProfile;