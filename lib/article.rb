require 'csv'
require 'pry'

class Article

  attr_accessor :author, :content

  def initialize(author,content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/article.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_articles = []
    CSV.read("./db/article.csv").each do |csv_line|
      all_articles << Article.new(csv_line[0], csv_line[1])
    end
    return all_articles
  end

  def self.find(id)
    # 1) j'ouvre ma table csv ds un array
    articles = CSV.read('./db/article.csv')
    # 2) je cherche ds mon array au bon index
    articles.at(id.to_i - 1)
  end


  def self.update
    # 1) j'ouvre ma table csv ds un array(methode find?)
   
    # 2) je cherche ds mon array au bon index (methode find?)
  
    # 3) je modifie mon article (methode save?)
    # 4) Re push l'article modifier ds l'array au meme index :/
  end

end

#binding.pry