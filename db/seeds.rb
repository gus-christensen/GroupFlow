

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
  user_id:commentor.id,
  commentable: answer
  )

answer2 = Answer.create(
  body:"just google it!",
  user_id: commenter.id,
  post_id: post1.id
  )

comment2 = Comment.create(
  body:"Bro, That was a bad reccommendation",
  user_id:answerer.id,
  commentable: answer2
  )

comment3 = Comment.create(
  body:"like rly",
  user_id:creator.id,
  commentable: post1
  )

post1.votes.create(voteable:answerer,value:1)


