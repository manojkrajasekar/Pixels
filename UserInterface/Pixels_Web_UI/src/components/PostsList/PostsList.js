import React from 'react';
import { connect } from 'react-redux';
import PostsListsItem from './PostsListsItem';
import FileDataItem from './FileDataItem';

const PostsList = (props) => (
    <div>
        <div>
            {props.posts.map((post) => {
                return <PostsListsItem key={post.id} {...post} />
            })}
        </div>
        <div>
          
              <FileDataItem {...props.filedata} />
          
        </div>
    </div>
);

const mapStateToProps = (state) => {
    return {
        posts: state.posts,
        filedata: state.filedata
    };
} ;

export default connect(mapStateToProps)(PostsList);