import React, { Component } from 'react';
import './Bestfind.css';

class Bestfind extends Component {
    render() {
        return (
            <div className="winner-details">
                <div className="best-find">BEST FIND</div>
                <div className="winner-post">
                    <img src="https://static.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg"/>
                </div>
                <div className="winner-post-details">
                    <div className="winner">
                         <span className="posted-by">Post By</span>
                         <span className="winner-name">MANO</span>
                    </div>
                    <div className="total-votes">
                        <span className="no-of-votes">Votes</span>
                        <span className="vote-count">2300</span>
                    </div>
                </div>
            </div>
        );
    }
}

export default Bestfind;