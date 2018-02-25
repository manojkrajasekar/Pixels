import React from 'react';
import Modal from 'react-modal';
import './ImagesModal.css';

const ImagesModal = (props) => {
    return (
        <Modal
            isOpen={!!props.UploadedImage}
            onRequestClose={props.ClearUpload}
            contentLabel="Selected Option"
            closeTimeoutMS={4000}
            className="modal"
        >
            <h3  className="Heading">Post a Pic</h3>
            <input className="fileChoose" type="file" onChange={this.UploadImage}/>
            <textarea className="PostDescription" placeholder="Add a Description here"></textarea>
            <div >
                <button className="Cancel">Cancel</button>
                <button className="Done" onClick={props.ClearUpload}>Post</button>
            </div>
        </Modal>
        //
    )
};

export default ImagesModal;

