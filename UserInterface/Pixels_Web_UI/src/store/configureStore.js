import { createStore, combineReducers } from 'redux';
import commentReducer from '../reducers/commentReducer'; 
import votesReducer from '../reducers/votesReducer';
import postsReducer from '../reducers/postsReducer';

const store = createStore(
    combineReducers({
        comments: commentReducer,
        votes: votesReducer,
        posts: postsReducer
    })
);


const  demoState = {
    comments: [{
        description: 'poons',
        commented_by: 'mamama'
    }],
};

console.log(store.getState());

export default store;