json.array! @articles.each do |article|
  json.id article.id
  json.title article.title
  json.author article.author
  json.image article.image
  json.date article.date
  json.description article.description
end