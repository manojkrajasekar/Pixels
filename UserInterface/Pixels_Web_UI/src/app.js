import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import IndexPage from '../src/components/IndexPage/IndexPage';
import store from './store/configureStore';
import { AddComment, DeleteComment, EditComment } from './actions/commentsAction';
import { AddVote } from './actions/votesAction';
import { Provider } from 'react-redux';


class App extends Component {
    render() {
        return (
            <BrowserRouter>
                <IndexPage />
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
  




