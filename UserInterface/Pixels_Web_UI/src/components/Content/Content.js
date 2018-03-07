import React, { Component } from 'react';
import { BrowserRouter, Route, Link, Switch } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Header from '../Layout/Header/Header';
import PageNotFound from '../Layout/PageNotFound/PageNotFound';
import PostsList from '../posts/PostsList';
import UserProfile from '../UserProfile/UserProfile';
import EditProfile from '../UserProfile/EditProfile/EditProfile';
import PostDetail from '../shared/PostDetail/PostDetail';
import LandingPage from '../LandingPage/LandingPage';
import './Content.css';

class Content extends Component {
    render() {
        return (
            <div>
                <div>
                    <Header />
                </div>
                <div>
                    <Switch>
                        <Route exact path="/"  component={LandingPage}/>
                        <Route exact path="/postsList" component={PostsList} />
                        <Route exact path="/user" component={UserProfile} />
                        <Route exact path="/edit" component={EditProfile} />
                        <Route exact path="/post" component={PostDetail} />
                        <Route component={PageNotFound} />
                    </Switch>
                </div>
            </div>
        );
    }
}

export default Content;