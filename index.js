exports.handler = async (event) => {

const GhostAdminAPI = require('@tryghost/admin-api');

const api = new GhostAdminAPI({
  url: event.key1,
  key: event.key2,
  version: "v3.0"
});

await api.posts
    .browse({limit: "all" })
    .then((posts) => {
        posts.forEach((post) => {
            console.log(post.id);
            api.posts.delete({id: post.id});
        });
    });
    
const response = {
    statusCode: 200,
    body: JSON.stringify('Exit'),
};

return response;
};
