import React from 'react';
import ReactDOM from 'react-dom';
import FacebookLogin from 'react-facebook-login';
import Facebooklogin from './components/Facebooklogin';
// import './index.css';
// import App from './App';
import registerServiceWorker from './registerServiceWorker';


// const responseFacebook = (response) => {
//     console.log(response);
//   }
   

ReactDOM.render(
    // <FacebookLogin
    // appId="1099422136861554"
    // autoLoad={true}
    // fields="name,email,picture"
    // //onClick={componentClicked}
    // callback={responseFacebook} />
    <Facebooklogin />    
    , document.getElementById('root'));
registerServiceWorker();
