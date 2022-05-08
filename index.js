exports.handler = async (event) => {

const GhostAdminAPI = require('@tryghost/admin-api');

const api = new GhostAdminAPI({
  url: 'http://ghost-lb-1239055692.eu-west-2.elb.amazonaws.com',
  key: '62778ff7672f5c156f79df28:eebd3871263a0287c507423704da0310c6754dc48ecdd7df2faaeec3a93b3099',
  version: "v3.0"
});

api.posts
    .browse({limit: "all" })
    .then((posts) => {
        posts.forEach((post) => {
            console.log(post.id);
            api.posts.delete({id: post.id});
        });
    });
    
const response = {
    statusCode: 200,
    body: JSON.stringify('Success'),
};

return response;
}
