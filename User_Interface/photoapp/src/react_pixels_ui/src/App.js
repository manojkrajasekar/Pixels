import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Link } from 'react-router-dom';
//import Landing_page from './components/Landing_page/Landing_page.js';
import Content from './components/shared/Content/Content.js';
import Topicposts from './components/Topic_posts/Topicposts.js';
import PostDetails from './components/Post_details/PostDetails.js';
// import PostDetail from './components/shared/PostDetail/PostDetail';
import UserProfile from './components/UserProfile/UserProfile.js';
import EditProfile from './components/EditProfile/EditProfile.js';
import './App.css';
import Router from 'react-router-dom/Router';


class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div>
          <Route exact path="/" component={Content} />
          <Route exact path="/post" component={PostDetails} />
          <Route exact path="/user" component={UserProfile} />
        </div>
        
      </BrowserRouter>
    );
  }
}

export default App;
