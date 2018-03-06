import { createStore, combineReducers } from 'redux';
import commentReducer from '../reducers/commentReducer'; 
import votesReducer from '../reducers/votesReducer';

const store = createStore(
    combineReducers({
        comments: commentReducer,
        votes: votesReducer
    })
);

export default store;