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
                    <div className="cancel">Cancel</div>
                    <div className="submit-changes">Save changes</div>
                </div>
            </div>
        );
    }
}

export default EditSection;