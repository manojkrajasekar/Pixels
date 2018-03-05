import { createStore } from 'redux';

function vote(state = { count: '' }, action) {
    switch(action.type) {
        case 'ADD_VOTE':
            return {
                count: !!state.count
            };
        default:
            return state;
    }
}

// const store = createStore((state = { count: 'false' }, action) => {
//     switch(action.type) {
//         case 'ADD_VOTE':
//             return {
//                 count: !!state.count
//             };
//         default:
//             return state;
//     }
// });

const store = createStore(vote, false);



store.dispatch({
    type:'ADD_VOTE'
});

console.log(store.getState());

store.dispatch({
    type:'ADD_VOTE'
});

console.log(store.getState());
