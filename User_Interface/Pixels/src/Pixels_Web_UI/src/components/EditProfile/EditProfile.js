import React, { Component } from 'react';
import Header from '../shared/Header/Header.js';
import UserDetails from '../shared/UserDetails/UserDetails';
import EditSection from './EditSection/EditSection.js';
import './EditProfile.css';

class EditProfile extends Component {
    render(){
        return (
            <div className="wrapper">
                <Header />
                <div className="EditProfile">
                    <UserDetails />
                    <EditSection />
                </div>
            </div>
        );
    }
}

export default EditProfile;