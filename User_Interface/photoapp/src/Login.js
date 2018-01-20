import React, { Component } from 'react';
import './Login.css';

class Login extends Component {
    render() {
        return (
            <div className="flex-container">
                <div className="login-screen">
                    <div className="google">
                        LOGIN WITH GOOGLE
                    </div>
                    <div className="credentials">
                        <input type="text" className="email" name="login" placeholder="Email"/>
                        <input type="text" className="pwd" name="password" placeholder="password"/>
                        <div className="login">
                            Log In
                        </div>
                        <div className="signUp">
                            Don't have an account yet ?
                                <span className="sign">
                                    SignUp
                                </span>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;