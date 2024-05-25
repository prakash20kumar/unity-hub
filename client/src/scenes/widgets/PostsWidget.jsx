import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { setPosts } from "state";
import PostWidget from "./PostWidget";
import axiosInstance from '../../axiosConfig';

const PostsWidget = ({ userId, isProfile = false }) => {
  const dispatch = useDispatch();
  const posts = useSelector((state) => state.posts);

  const getPosts = async () => {
    const response = await axiosInstance.get("/posts");
    dispatch(setPosts({ posts: response.data }));
  };

  const getUserPosts = async () => {
    const response = await axiosInstance.get(`/posts/${userId}/posts`);
    dispatch(setPosts({ posts: response.data }));
  };

  useEffect(() => {
    const fetchData = async () => {
      if (isProfile) {
        await getUserPosts();
      } else {
        await getPosts();
      }
    };

    fetchData();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isProfile, userId]); 

  return (
    <>
      {posts.map(
        ({
          _id,
          userId,
          firstName,
          lastName,
          description,
          location,
          picturePath,
          userPicturePath,
          likes,
          comments,
        }) => (
          <PostWidget
            key={_id}
            postId={_id}
            postUserId={userId}
            name={`${firstName} ${lastName}`}
            description={description}
            location={location}
            picturePath={picturePath}
            userPicturePath={userPicturePath}
            likes={likes}
            comments={comments}
          />
        )
      )}
    </>
  );
};

export default PostsWidget;
