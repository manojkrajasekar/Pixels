import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import './PostsListItem.css';

class PostsListItem extends Component {
    
    GoToUser = () => {
        this.props.history.push('/user');
    }

    GoToPost = () => {
        this.props.history.push('/post')
    }


    render() {
        return (
            <div>
                <div className="posted_by" onClick={this.GoToUser}>
                    {this.props.post_by}
                </div>
                <div className="post-pic" onClick={this.GoToPost}>
                    <img src={this.props.post_URL}/>
                </div>
            </div>
        );
    }
}


export default withRouter(PostsListItem);