require "bundler"
Bundler.require

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
  def save
    CSV.open("./db/gossips.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
end
