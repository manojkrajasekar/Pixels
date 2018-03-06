import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';

import Content from '../src/components/shared/Content/Content';

//import Posts from './components/posts/Posts';
import PostsByTopic from './components/PostsByTopic/PostsByTopic';
import UserProfile from './components/UserProfile/UserProfile';
import EditProfile from './components/EditProfile/EditProfile';
import PostDetail from './components/shared/PostDetail/PostDetail';
import store from './store/configureStore';

import { AddComment, DeleteComment, EditComment } from './actions/comments';
import { AddVote } from './actions/votes';
import { Provider } from 'react-redux';
//import 'bootstrap/css/bootstrap.css';
// import 'normalize.css/normalize.css';
// import './styles/styles.scss';
//store.dispatch(AddComment({ comment:'Cool', commented_by: 'Mano'}));

store.dispatch(AddVote());
console.log(store.getState());

store.dispatch(AddVote());
console.log(store.getState());

store.dispatch(AddVote());
console.log(store.getState());

store.subscribe( () => {
    console.log(store.getState());
});

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
  




