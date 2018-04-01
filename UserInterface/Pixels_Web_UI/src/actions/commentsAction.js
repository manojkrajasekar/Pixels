import uuid from 'uuid';

 export const AddComment = (
     { 
         comment = '',
         commented_by = '',
         commented_on = '',
         post_id
     } = {}
 ) => ({
         type: 'ADD_COMMENT',
         Comments: {
             id: uuid(),
             comment,
             commented_by,
             commented_on,
             post_id
         }
     });

export const EditComment = (id, updates)  => ({
        type:'EDIT_COMMENT',
        id,
        updates
});


export const DeleteComment = ({id} = {}) => {
    return {
        type: 'DELETE_COMMENT',
        id
    };
};

