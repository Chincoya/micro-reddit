# Micro-Reddit

This repository holds one very basic implementation of data models for a User-Post-Comments platform in Ruby on Rails. 

## Getting started

Clone the repository with:

```bash
git clone https://github.com/Oitur/micro-reddit
```

Then change to the repository directory, with

```bash
 cd micro-reddit/
```
Use the Rails specific Bash command
```bash
bundle install --without production
```
to install missing gems and packages needed -as specified inside the gemfile and yarn.lock. Afterwards, run the database migration with:

```bash
rails db:migrate
```

If you followed the steps correctly, you should be able to run the Rails server with the command:
```bash
rails server
```
The system will be served on **localhost:3000/**, but you won't be able to interact with it through your browser. 
In order to interact with the database, you'll need to use the rails console, with:
```bash
rails console
```
## Users, Posts and comments


Users are created in the rails console with the command:
```ruby
User.create(username: SOME_NAME, email: SOME_EMAIL)
```
A user will be created and saved in the database **unless** the email has an invalid format. Both username: and email: **must** be unique.

Post are created in the Rails console with the command:
```ruby
Post.create(title: A_TITLE, content: SOME_TEXT, user_id: A_NUMBER)
```
While creating posts, note that :title and :content can't be blank, and that :user_id **must** be a valid :user_id svaes in the database.

Comments are created in the Rails console with the command:
```ruby
Comment.create(content: SOME_TEXT, user_id:A_NUMBER, post_id: ANOTHER_NUMBER)
```
Note that :user_id and :post_id **must** be valid ids saved in the database. :content cna't be blank

Standard Rails operations can be performed on the database, like retrieving all users:
```ruby
users = User.all
```

or finding all post from a specific user:
```ruby
user_posts = User.find(A_NUMBER).posts
```
or finding the original poster of a Post where a comment has been made:
```ruby
User.find(Post.find(Comment.find(A_NUMBER).post_id).user_id)
```

## Dependencies

This project uses 
- Ruby v2.6.3
- Ruby on Rails v6.0.1

For its building. Other dependencies are listed in the Gemfile, located inside the root directory.  

### Authors

- Roberto Erick Nava | [Github](https://github.com/Oitur/micro-reddit)
- Daniel Chincoya    | [@chincoya7](https://twitter.com/chincoya7)