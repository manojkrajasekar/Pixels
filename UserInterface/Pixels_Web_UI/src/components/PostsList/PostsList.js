import React from 'react';
import { connect } from 'react-redux';
import PostsListsItem from './PostsListsItem';

const PostsList = (props) => (
    <div>
        <div>
            {props.posts.map((post) => {
                return <PostsListsItem key={post.id} {...post} />
            })}
        </div>
    </div>
);

const mapStateToProps = (state) => {
    return {
        posts: state.posts
    };
} ;

export default connect(mapStateToProps)(PostsList);