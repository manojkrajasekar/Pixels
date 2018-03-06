
const votedefaultState = {
    count: false
};

const votesReducer = (state = votedefaultState, action) => {
    switch(action.type)
    {
        case 'ADD_VOTE':
            return Object.assign({}, state, {
               count: !state.count 
            });
        default:
            return state;
    }
};

export default votesReducer;