# Instagram Clone

* [Task & User Stories](#task)
* [My Approach](#my-approach)
* [Directory Structure](#directory-structure)
* [App Usage and Features](#app-usage-and-features)
* [Demo App](#demo-app)
* [Download Instructions](#download-instructions)

## Task

Build a clone of [Instagram](https://www.instagram.com/) using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website.

#### User Stories:

```
As a User
So that I can view my friends' pictures
I want to sign up to Instagram

As a User
So that I can share my own pictures
I want to post a picture with a title

As a User
So that I can easily find the most recently made posts
I want to view all posts in chronological order

As a User
So that I can get more information about a post
I want to see the post's author, time it was posted and all its comments

As a User
So that I can show how much I like a post
I want to 'like' a post

As a User
So that I can share my own thoughts
I want to comment on a post
```

## My Approach

I set myself a **target** for this project which was to *make the app function and look as close as possible to the real Instagram website*. I wanted to challenge and prove to myself that I could build something similar to an app that is already being used on a large scale.

There were **two practices** that I focused on while building this project. The first was to take an **agile approach**. For this reason I broke the app down to the above **user stories** and then worked on each one individually (in a **TDD** approach of couse). This way I could build the app feature-by-feature.

The second practice that I focused heavily on was **git flow** i.e. *the agile approach of version control*. To achieve this, I always created a separate git branch (from master) for each new feature. I then made all commits to this separate branch and only once all tests had passed for that feature did I then merge that branch into master. This had significantly improved my git flow skills.

Once the app was fully built and tested I then worked on the **styling**. I wanted to make the app look exactly like Instagram and I'm glad to say that this has been achieved. I had used **HTML**, **CSS**, **Sass** and **Bootstrap** to complete the front-end.

As for **data storage**, I had integrated **Amazon's AWS/S3** service in order to store the images.

## Directory Structure

```
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── comments_controller.rb
│   │   ├── posts_controller.rb
│   │   └── likes_controller.rb
│   │
│   ├── models/
│   │   ├── comment.rb
│   │   ├── like.rb
│   │   ├── post.rb
│   │   └── user.rb
│   │
```

## App Usage and Features

***New user can sign up to Instagram:***

![Sign Up Page](https://github.com/hsheikhm/Github-Images/blob/master/instagram-clone/signup.png)

***Existing user can login to Instagram:***

![Login Page](https://github.com/hsheikhm/Github-Images/blob/master/instagram-clone/login.png)

***User can view all posts in chronological order:***

![Home Page](https://github.com/hsheikhm/Github-Images/blob/master/instagram-clone/allposts.png)

***User can make a new post:***

![New Post Page](https://github.com/hsheikhm/Github-Images/blob/master/instagram-clone/newpost.png)

***User can like a post and enter a comment:***

![Like and Comment](https://github.com/hsheikhm/Github-Images/blob/master/instagram-clone/likeandcomment.png)

## Demo App

Visit the link below to see a live version of the app.

[Instagram Clone App](https://clone-of-instagram.herokuapp.com/users/sign_in)

## Download Instructions

Follow the below instructions on your terminal to download the app:

```
$ git clone https://github.com/hsheikhm/instagram_clone.git
$ cd instagram_clone
$ bundle
$ bin/rake db:create
$ bin/rake db:migrate
$ rails s
(visit localhost)
```
