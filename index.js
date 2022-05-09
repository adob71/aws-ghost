exports.handler = async (event) => {

var status = "OK";

const GhostAdminAPI = require('@tryghost/admin-api');

const api = new GhostAdminAPI({
  url: event.API_URL,
  key: event.Admin_API_key,
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

