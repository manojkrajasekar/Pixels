// const  commentsReducerDefaultState = {
//     comments: [{
//         description: '',
//         commented_by: ''
//     }],
// };

const commentsReducerDefaultState = [];
//const commentReducer = (state = { count: 0, comment: undefined}, action) => {
    const commentReducer = (state = commentsReducerDefaultState, action) => {
    switch(action.type){
        case 'ADD_COMMENT':
            return [
                ...state,
                action.Comments
            ];
        case 'DELETE_COMMENT':
            return state.filter(({ id }) =>  id !== action.id);
        case 'EDIT_COMMENT':
            return state.map((Comments) => {
                 if(Comments.id === action.id) {
                     return {
                         ...Comments,
                         ...action.updates
                     };
                 }
                 else {
                     return Comments
                 }

             });
        default:
            return state;
    }
};

export default commentReducer;