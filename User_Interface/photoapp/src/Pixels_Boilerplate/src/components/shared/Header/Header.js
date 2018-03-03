import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './Header.css';
import { withRouter } from 'react-router-dom';
import ImagesModal from '../../ImagesUpload/ImagesModal';

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

    // Upload = () => {
    //     console.log('hai');
    //     this.setState({
    //         UploadedImage:'asss' 
    //     })
    // }
    ClearUpload = () => {
            // this.setState( () => ({
            //     UploadedImage:undefined
            // })
            this.setState({
                UploadedImage:false 
            })
        //);
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
                <div className="App-title" onClick={this.GoToMain}>PIXELS</div>
                
                <ImagesModal ref="child" />
                <div onClick={() => this.refs.child.openModal()} className="add-a-post">POST</div>
                <ImagesModal
                         UploadedImage={this.state.UploadedImage} 
                         ClearUpload={this.state.ClearUpload}
                />
                <input type="text" className="Search-bar" placeholder="search" ></input>
                <span className="User-name" onClick={this.GoToUser}>Mano</span>
                <span className="log-out">Log out</span> 
            </div>
        );
    }
}

export default withRouter(Header);
