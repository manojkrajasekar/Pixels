import uuid from 'uuid';


export const AddPost = (
    {
        post_by = '',
        post_URL = '',
        topic_id
    } = {}
) => ({
    type:'ADD_POST',
        Posts: {
            id: uuid(),
            post_by,
            post_URL,
            topic_id
        }
    });


export const ShowPost = (topic_id) => ({
    type: 'SHOW_POST',
    topic_id
})
