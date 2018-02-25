import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './Header.css';
import ImagesModal from '../../ImagesUpload/ImagesModal';

class Header extends Component {
    state = {
        selectedFile: null,
        UploadedImage: undefined
    }
    UploadImage = (event) => {
        this.setState({
            selectedFile: event.target.files[0]
        })
    }

    Upload = () => {
        console.log('hai');
        this.setState({
            UploadedImage:'asss' 
        })
    }
    ClearUpload = () => {
            // this.setState( () => ({
            //     UploadedImage:undefined
            // })
            this.setState({
                UploadedImage:false 
            })
        //);
    }
    render() {
        return (
            <div className="header">
                <div className="App-title">PIXELS</div>
                <div onClick={this.Upload} className="add-a-post">Add a post</div>
                <ImagesModal
                         UploadedImage={this.state.UploadedImage} 
                         ClearUpload={this.state.ClearUpload}
                />
                <input type="text" className="Search-bar" placeholder="search"></input>
                <span className="User-name">Mano</span>
                
                <span className="log-out">Log out</span> 
            </div>
        );
    }
}

export default Header;
