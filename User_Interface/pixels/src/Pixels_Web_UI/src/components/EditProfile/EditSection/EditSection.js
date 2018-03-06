import React, { Component } from 'react';
import './EditSection.css';

class EditSection extends Component {
    render(){
        return (
            <div className="edit-section">
                <div className="edit-username">
                    <span className="username">User name</span>
                    <span className="enter-username"></span>
                </div>
                <div className="save-changes">
                    <span className="cancel">Cancel</span>
                    <sapn className="submit-changes">Save changes</sapn>
                </div>
            </div>
        );
    }
}

export default EditSection;