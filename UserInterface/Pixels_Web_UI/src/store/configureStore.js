import { createStore, combineReducers } from 'redux';
import commentReducer from '../reducers/commentReducer'; 
import votesReducer from '../reducers/votesReducer';

const store = createStore(
    combineReducers({
        comments: commentReducer,
        votes: votesReducer
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