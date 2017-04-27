class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render "index.json.jbuilder"
  end
  def create
    @article = Article.create(
      title: params[:title],
      author: params[:author],
      image: params[:image],
      date: params[:date],
      description: params[:description]
      )
    render "show.json.jbuilder"
  end
  def show
    @article = Article.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
  def update
    @article = Article.find_by(id: params[:id])
    @article.title = params[:title] || @article.title
    @article.author = params[:author] || @article.author
    @article.image = params[:image] || @article.image
    @article.date = params[:date] || @article.date
    @article.description = params[:description] || @article.description
    @article.save
    render "show.json.jbuilder"
  end
  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    render json: {message: "Article successfully destroyed!"}
    render json: {message: "Article successfully destroyed!"}
  end
end
