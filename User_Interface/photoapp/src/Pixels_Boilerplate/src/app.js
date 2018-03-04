import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Link } from 'react-router-dom';
import Content from '../src/components/shared/Content/Content';
//import Posts from './components/posts/Posts';
import PostsByTopic from './components/PostsByTopic/PostsByTopic';
import UserProfile from './components/UserProfile/UserProfile';
import EditProfile from './components/EditProfile/EditProfile';
import PostDetail from './components/shared/PostDetail/PostDetail';
import store from './store/configureStore';
import { withRouter } from 'react-router-dom';
import { AddComment, DeleteComment, EditComment } from './actions/comments';
import { AddVote } from './actions/votes';
import { Provider } from 'react-redux';
//import 'bootstrap/css/bootstrap.css';
// import 'normalize.css/normalize.css';
// import './styles/styles.scss';

//const store = store();
store.dispatch(AddComment({ comment:'Interesting Snap', commented_by: 'Mano'}));
// store.dispatch(AddComment({ comment:'Swag Mapla', commented_by: 'Senthu'}));
// store.dispatch(AddComment({ comment:'Dispatching', commented_by: 'Lako'}));
// const sample = store.dispatch(AddComment({ comment:'Marvellous', commented_by: 'ky'}));

// const comment_john = store.dispatch(AddComment({ comment:'Freaking cold', commented_by: 'John'}));

// console.log(sample.comments.id);
// console.log(store.getstate());

//store.dispatch(DeleteComment({id: comment_john.Comments.id}));
//store.dispatch(EditComment(sample.Comments.id, {comment:'Stupendous'}));

store.dispatch(AddVote());
console.log(store.getState());

store.dispatch(AddVote());
console.log(store.getState());

store.dispatch(AddVote());
console.log(store.getState());

// store.dispatch(AddVote());
// console.log(store.getState());


store.subscribe( () => {
    console.log(store.getState());
});

class App extends Component {
    render() {
        return (
            <BrowserRouter>
                <div>
                    <Route exact path="/" component={Content} />
                    <Route exact path="/posts" component={PostsByTopic} />
                    <Route exact path="/user" component={UserProfile} />
                    <Route exact path="/edit" component={EditProfile} />
                    <Route exact path="/post" component={PostDetail} />
                </div>
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
  




