import React, { Component } from 'react';
import { BrowserRouter, Route, Link, Switch } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Header from '../../shared/Header/Header.js';
import PostsByTopic from '../../PostsByTopic/PostsByTopic';
import UserProfile from '../../UserProfile/UserProfile';
import EditProfile from '../../EditProfile/EditProfile';
import PostDetail from '../../shared/PostDetail/PostDetail';
import PageNotFound from '../PageNotFound/PageNotFound';
import Landing_page from '../../Landing_page/Landing_page.js';
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
                        <Route exact path="/"  component={Landing_page}/>
                        <Route exact path="/posts" component={PostsByTopic} />
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