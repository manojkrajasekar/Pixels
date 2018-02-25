import React, { Component } from 'react';
import Header from '../shared/Header/Header.js';
import UserDetails from '../shared/UserDetails/UserDetails.js';
import EditSection from './EditSection/EditSection.js';
import './EditProfile.css';

class EditProfile extends Component {
    render(){
        return (
            <div>
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