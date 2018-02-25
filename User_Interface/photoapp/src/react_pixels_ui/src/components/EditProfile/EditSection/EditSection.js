import React, { Component } from 'react';
import './EditSection.css';

class EditSection extends Component {
    render(){
        return (
            <div class="edit-section">
                <div class="edit-username">
                    <span class="username">User name</span>
                    <span class="enter-username"></span>
                </div>
                <div class="save-changes">
                    <span class="cancel">Cancel</span>
                    <sapn class="submit-changes">Save changes</sapn>
                </div>
            </div>
        );
    }
}

export default EditSection;