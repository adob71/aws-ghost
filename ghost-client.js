const GhostContentAPI = require('@tryghost/content-api');

const api = new GhostContentAPI({
  url: 'https://demo.ghost.io',
  key: '22444f78447824223cefc48062',
  version: "v3.0"
});

// fetch 5 posts, including related tags and authors
api.posts
    .browse({limit: 10, include: 'tags,authors'})
    .then((posts) => {
        posts.forEach((post) => {
            console.log(post.title);
        });
    })
    .catch((err) => {
        console.error(err);
    });
