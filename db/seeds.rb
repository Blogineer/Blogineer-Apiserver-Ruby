# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
5.times do
    author = Author.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name)
    article = Article.create(
        title: Faker::Book.title,
        body: Faker::Books::Dune.quote,
        author: author)
    
    # for each article, generate 5 comments
    5.times do
        comment = Comment.create(
            content: Faker::Superhero.name,
            author: author,
            article: article
        )
    end
end