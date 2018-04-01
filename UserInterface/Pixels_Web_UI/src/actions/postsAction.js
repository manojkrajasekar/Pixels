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


export const AddImage = ({file}) => {
    let filedata = new FormData();
    console.log(file.name);
    filedata.append('name', file.name);
    
    return {
        type:'ADD_IMAGE',
        filedata
   } 
}

export const ShowPost = (topic_id) => ({
    type: 'SHOW_POST',
    topic_id
})
