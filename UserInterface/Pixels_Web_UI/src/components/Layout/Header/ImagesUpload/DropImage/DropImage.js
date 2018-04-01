import React, { Component } from 'react';
import Dropzone from 'react-dropzone';
import request from 'superagent';


class DropImage extends Component {
    state = {
        files: []
    };

    handleOnDrop = (files) => {
        this.setState({files});
        console.log(files[0]);
    }
    render() {
        return (
            <Dropzone onDrop = {this.handleOnDrop}>
                
                <p>Drop an image or click to select a file to upload.</p>
            
            </Dropzone>
        );
    }
}

export default DropImage;