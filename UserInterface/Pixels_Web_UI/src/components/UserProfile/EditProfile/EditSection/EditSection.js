import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import './EditSection.css';

class EditSection extends Component {
    goBack = () => {
        this.props.history.push('/user');
    }
    render(){
        return (
            <div className="edit-section">
                <div className="edit-username">
                    <span className="username">Username</span>
                        <input type="text" className="enter-username" />
                </div>
                <div className="save-changes">
                    <div className="cancel" onClick={this.goBack}>Cancel</div>
                    <div className="submit-changes" onClick={this.goBack}>Save</div>
                </div>
            </div>
        );
    }
}

export default withRouter(EditSection);