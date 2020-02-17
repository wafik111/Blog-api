# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# Blog instruction

- use Docker compose up to run the project

# Notes

- the authentication was made with a gem 'Devise auth token' it is like Devise but with JWT .
- occasionally an issue happened with redis that refused connect i didn't figure out why .

# APIS

- ------- AUTH ---------
- POST /auth ===== this Api wil create a User
- POST /auth/sign_in ==== this will return in the header {access-token: '', client: '', uid: ''} send them in the header
- ------- POSTS --------
- GET /api/v1/posts
- POST /api/v1/posts , takes : {title:'', body: '', user_id: '', tags: [{tag: ''}]}
- GET /api/v1/posts/:id
- PUT /api/v1/posts/:id, takes : {title:'', body: '', user_id: '', tags: [{tag: ''}]}
- DELETE /api/v1/posts/:id
