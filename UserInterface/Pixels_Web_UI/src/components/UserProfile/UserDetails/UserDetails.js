import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import './UserDetails.css';

class UserDetails extends React.Component {
    constructor(props){
        super(props);
    }
    GoToEdit = () => {
        this.props.history.push('/edit')
    }
    render() {
        return(
                <div className="User-Details">
                    <div className="user-profile">
                        <div className="user-pic"></div>
                        {this.props.showvalue && 
                            <div className="edit-profile" onClick={this.GoToEdit}>
                                Edit profile
                            </div>
                        }
                    </div>
                    <div className="user-info">
                        <div className="user-name">Mano Rajasekar</div>
                        <div className="user-email">
                            <span>@</span>
                            manoj.k.rajasekar@gmail.com
                        </div>
                        <div className="total-posts">
                            <span>#posts</span>
                            <span className = "no-of-posts">4</span>
                        </div>
                    </div>
                </div>
            
        );
    }
}

export default withRouter(UserDetails);