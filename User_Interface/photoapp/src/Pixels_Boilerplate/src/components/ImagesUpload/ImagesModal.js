import React, { Component } from 'react';
import Modal from 'react-modal';
import { Button } from 'react-bootstrap';
import DropImage from '../shared/DropImage/DropImage';
import './ImagesModal.css';

class ImagesModal extends Component {
    constructor() {
        super();
        
        this.state = {
            modalIsopen: false
        };

        this.openModal = this.openModal.bind(this);
        
        this.closeModal = this.closeModal.bind(this);
      }
    
      openModal() {
        this.setState({modalIsOpen: true});
      }
    
    //   afterOpenModal() {
    //     // references are now sync'd and can be accessed.
    //     this.subtitle.style.color = '#f00';
    //   }
    
      closeModal() {
        this.setState({modalIsOpen: false});
      }
    
      render() {
        return (
          <div className="wrapper">
            <Modal
              isOpen={this.state.modalIsOpen}
            //   onAfterOpen={this.afterOpenModal}
              onRequestClose={this.closeModal}
              className="modal"
              contentLabel="Example Modal"
            >
             <h1>Post a pic</h1>
             <input className="fileChoose" type="file" onChange={this.UploadImage}/>
             <DropImage />
             <textarea className="PostDescription" placeholder="Add a Description here"></textarea>
              <div className="buttonwrapper">
                <button className="Cancel" onClick={this.closeModal}>Cancel</button>
                <button className="Done">Upload</button>
              </div>
            </Modal>
          </div>
        );
      }
    }

export default ImagesModal;