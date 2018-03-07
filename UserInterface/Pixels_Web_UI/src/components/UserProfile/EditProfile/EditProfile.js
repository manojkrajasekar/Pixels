import React, { Component } from 'react';
import Header from '../../Layout/Header/Header';
import UserDetails from '../UserDetails/UserDetails';
import EditSection from './EditSection/EditSection.js';
import './EditProfile.css';

class EditProfile extends Component {
    render(){
        return (
            <div className="EditPage">
                <div className="EditProfile">
                    <UserDetails />
                    <EditSection />
                </div>
            </div>
        );
    }
}

export default EditProfile;