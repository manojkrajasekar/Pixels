import React, { Component } from 'react';
import { BrowserRouter, Route, Link, Switch } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Header from '../Layout/Header/Header';
import PageNotFound from '../Layout/PageNotFound/PageNotFound';
import ViewPosts from '../posts/ViewPosts';
import UserProfile from '../UserProfile/UserProfile';
import EditProfile from '../UserProfile/EditProfile/EditProfile';
import PostDetail from '../shared/PostDetail/PostDetail';
import LandingPage from '../LandingPage/LandingPage';
import './IndexPage.css';

class IndexPage extends Component {
    render() {
        return (
            <div>
                <div>
                    <Header />
                </div>
                <div>
                    <Switch>
                        <Route exact path="/"  component={LandingPage}/>
                        <Route exact path="/viewPosts/:id" component={ViewPosts} />
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

export default IndexPage;