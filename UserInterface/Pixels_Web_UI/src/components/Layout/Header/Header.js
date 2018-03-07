import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './Header.css';
import { withRouter } from 'react-router-dom';
import ImagesModal from '../Header/ImagesUpload/ImagesModal';

class Header extends Component {
    state = {
        selectedFile: undefined,
        UploadedImage: undefined
    }
    UploadImage = (event) => {
        this.setState({
            selectedFile: event.target.files[0]
        })
    }

    ClearUpload = () => {
            this.setState({
                UploadedImage:false 
            })
    }

    GoToUser = () => {
        this.props.history.push('/user')
    }

    GoToMain = () => {
        this.props.history.push('/')
    }

    render() {
        return (
            <div className="header">
                <div className="App-title" onClick={this.GoToMain}>Pixels</div>
                <div onClick={() => this.refs.child.openModal()} className="add-a-post">
                    <ImagesModal ref="child" />    
                    Post
                </div>
                <input type="text" className="Search-bar" placeholder="Search..." ></input>
                <span className="User-name" onClick={this.GoToUser}>Mano</span>
                <span className="log-out">log out</span> 
            </div>
        );
    }
}

export default withRouter(Header);
