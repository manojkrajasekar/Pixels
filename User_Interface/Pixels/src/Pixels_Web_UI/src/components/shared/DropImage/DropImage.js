import React, { Component } from 'react';
import Dropzone from 'react-dropzone';
import request from 'superagent';


class DropImage extends Component {
    render() {
        return (
            <Dropzone
                multiple={false}
                accept="image/*"
                >
                <p>Drop an image or click to select a file to upload.</p>
            
            </Dropzone>
        );
    }
}

export default DropImage;