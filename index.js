exports.handler = async (event) => {

var status = "OK";

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
            api.posts.delete({id: post.id});
        });
    })
    .catch((err) => {
        status = err;
    });

await api.posts
    .browse({limit: "all" })
    .then((posts) => {
        posts.forEach((post) => {
            api.posts.delete({id: post.id});
        });
    })
    .catch((err) => {
        status = err;
    });
    
const response = {
    statusCode: 200,
    body: JSON.stringify(status),
};

return response;
};

