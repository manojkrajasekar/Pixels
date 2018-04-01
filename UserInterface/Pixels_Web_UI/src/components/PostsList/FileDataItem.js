import React, { Component } from 'react';
import { withRouter } from 'react-router-dom';
import './fileDataItem.css';

class FileDataItem extends Component {
    render() {
        return (
            <div className="fileData">
                {this.props.fileData}
            </div>
        );
    }
}

// export default withRouter(FileDataItem);
export default FileDataItem;