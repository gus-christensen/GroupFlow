

creator= User.create(
email:'HectorFeurtado@gmail.com',
password:'12345'
)

answerer= User.create(
email:'AidenFeurtado@gmail.com',
password:'12345'
  )

commentor= User.create(
email:'Minkee@gmail.com',
password:'12345'
  )

post1 = Post.create(
question: "I've been trying to learn Ruby but I cant seem to find any good resources at all!",
title: "How do you Ruby?",
creator_id: creator.id
)

answer = Answer.create(
  body:"Try looking into the book, POODR. It's a pretty good book that will teach you about OOD(Object Oriented Design)",
  user_id: answerer.id,
  post_id: post1.id
  )

comment = Comment.create(
  body:"Bro, That was a bad reccommendation",
  user_id:1,
  commentable: post1
  )

post.votes.create(voteable:answerer,value:1)


