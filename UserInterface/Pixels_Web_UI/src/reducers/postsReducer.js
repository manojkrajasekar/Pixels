const postsReducerDefaultState = [];

const postsReducer = (state= postsReducerDefaultState, action) => {
    switch(action.type){
        case 'ADD_POST':
            return [
                ...state,
                action.Posts
            ];
        case 'ADD_IMAGE':
            return [
                ...state,
                action.filedata
            ];
        case 'SHOW_POST':
            return state.map((Posts) => {
            if(Posts.id === action.id){
                return {
                    ...Posts
                };
            }
            else {
                return Posts
            }
        });
        default:
            return state;
    }
}

export default postsReducer;