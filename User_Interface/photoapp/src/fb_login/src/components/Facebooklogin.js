import React, { Component } from 'react';
import './Facebooklogin.css';

class Facebooklogin extends Component{
    
    componentDidMount(){
        // Load the required SDK asynchronously for facebook, google and linkedin
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            //js.src = "//connect.facebook.net/en_US/sdk.js";
            js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
            //js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=1099422136861554";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        
        window.fbAsyncInit = function() {
            window.FB.init({
              appId      : '1099422136861554',
              cookie     : true,  // enable cookies to allow the server to access the session
              xfbml      : true,  // parse social plugins on this page
              version    : 'v2.8' // use version 2.1
            });
        };
    }
    
    facebooklogin = () => {
        window.FB.login(
            function(resp){
                this.statusChangeCallback(resp);
            }.bind(this),{ scope : 'email,user_work_history,user_education_history,user_location,public_profile' });
    }
    
    checkLoginState() {
        alert("Checking Login Status")
        console.log( "Checking login status..........." );
        
        window.FB.getLoginStatus(function(response) {
            alert("FB Callback")
            console.log("----------->")
            console.log(response)
            this.statusChangeCallback(response);
        }.bind(this));
    }
    
    statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            alert( "Connected to facebook. Retriving user from fb" );
            this.fetchDataFacebook();
        } else if (response.status === 'not_authorized') {
            console.log('Import error', 'Authorize app to import data', 'error')
        } else {
            console.log('Import error', 'Error occured while importing data', 'error')
        }
    }
    
    fetchDataFacebook = () => {
        console.log('Welcome!  Fetching your information.... ');

        window.FB.api('/me', function(user) {
            console.log( user );
            console.log('Successful login from facebook : ' + user.name);
            alert( 'Successful login for: ' + user.name );
        });
    }

    render(){
        return(
             //<img src={facebook} title="facebook login" alt="facebook" onclick={ () => this.facebooklogin() } />
           //<button onClick={() => this.facebooklogin()}/>
        //    <div class="fb-login-button" data-size="large" data-auto-logout-link="true" onclick={ () => this.facebooklogin() }></div>
            <div className="content">
                <div className="login">
                    <div className="app-title">
                        PIXELS
                    </div>
                    <div className="fblogin">
                        <div className="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" onClick={ () => this.facebooklogin() }></div>
                    </div>    
                </div>
                <div className="footer">
                    <span className="info">About us</span>
                    <span className="info">Privacy</span>
                    <span className="info">Terms</span>
                    <span className="info">Language</span>
                    <span className="info">Pixels c 2018</span>
                </div>
            </div>
        )
    }

}

export default Facebooklogin;