import { createStore, combineReducers, applyMiddleware } from 'redux';
import commentReducer from '../reducers/commentReducer'; 
import votesReducer from '../reducers/votesReducer';
import postsReducer from '../reducers/postsReducer';
import thunk from 'redux-thunk';

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const store = createStore(
    combineReducers({
        comments: commentReducer,   
        votes: votesReducer,
        posts: postsReducer,
    }),
    composeEnhancers(applyMiddleware(thunk))
);

console.log(store.getState());
export default store;