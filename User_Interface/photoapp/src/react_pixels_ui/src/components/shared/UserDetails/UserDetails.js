import React, { Component } from 'react';
import './UserDetails.css';

class UserDetails extends Component {
    render() {
        return(
            
                <div className="User-Details">
                    <div className="user-profile">
                        <div className="user-pic"></div>
                        <div className="edit-profile">
                            Edit profile
                        </div>
                    </div>
                    <div className="user-info">
                        <div className="user-name">Mano Rajasekar</div>
                        <div className="user-email">
                            <span>@</span>
                            manoj.k.rajasekar@gmail.com
                        </div>
                        <div className="total-posts">
                            <span># posts</span>
                            4
                        </div>
                    </div>
                </div>
            
        );
    }
}

export default UserDetails;