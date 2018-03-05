import { createStore } from "redux";

const AddComment = (payload = {}) => {
    return {
        type: 'ADD_COMMENT',
        comment: payload.comment
    };
};

const EditComment = (payload = {}) => {
    return {
        type: 'EDIT_COMMENT',
        comment: payload.comment
    }
};

const DeleteComment = () => {
    return {
        type: 'DELETE_COMMENT'
    };
};


const commentReducer = (state = { count: 0, comment: undefined}, action) => {
    switch(action.type){
        case 'ADD_COMMENT':
            return {
                count: state.count +1,
                comment: action.comment
            };
        case 'DELETE_COMMENT':
            return {
                count: state.count +2
            };
        case 'EDIT_COMMENT':
            return {
                comment: action.comment
            }
        default:
            return state;
    }
};


const store = createStore(commentReducer);

store.dispatch(AddComment({ comment: 'Awesome pic' }));
store.dispatch(EditComment({ comment: 'Awwwww' }));
store.dispatch(EditComment({ comment: 'Intruiging' }));


console.log(store.getState());

store.dispatch(DeleteComment());

console.log(store.getState());

store.subscribe(()=> {
    console.log(store.getState());
});

