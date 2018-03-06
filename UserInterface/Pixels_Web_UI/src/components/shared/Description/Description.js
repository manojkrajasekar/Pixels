import React, { Component } from 'react';
import './Description.css';

class Description extends Component {
    render(){
        return (
            <div className="Description">
                <span className="user">
                    Vicky:
                </span>
                <span className="Descriptioncontent">
                    Glad that I didn't miss this shot !
                </span>
                <div className="posted-time">
                    20 hours ago
                </div>
            </div>
        );
    }
}

export default Description;