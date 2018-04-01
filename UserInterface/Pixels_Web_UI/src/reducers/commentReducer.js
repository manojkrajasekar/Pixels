const commentsReducerDefaultState = [];
const commentReducer = (state = commentsReducerDefaultState, action) => {
    switch(action.type){
        case 'ADD_COMMENT':
            return [
                 ...state,
                 action.Comments
            ];
        case 'DELETE_COMMENT':
            //  state = state.filter(({ id }) =>  id !== action.id);
            //  return state;
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