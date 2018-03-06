import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import Content from '../src/components/shared/Content/Content';
import PostsByTopic from './components/PostsByTopic/PostsByTopic';
import UserProfile from './components/UserProfile/UserProfile';
import EditProfile from './components/EditProfile/EditProfile';
import PostDetail from './components/shared/PostDetail/PostDetail';
import store from './store/configureStore';
import { AddComment, DeleteComment, EditComment } from './actions/comments';
import { AddVote } from './actions/votes';
import { Provider } from 'react-redux';


class App extends Component {
    render() {
        return (
            <BrowserRouter>
                <Content />
            </BrowserRouter>
        );
    }
}

const jsx = (
    <Provider store={store}>
        <App />
    </Provider>
);

ReactDOM.render(jsx, document.getElementById('app'));
  




