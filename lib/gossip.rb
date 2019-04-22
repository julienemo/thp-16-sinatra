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

  def self.find(id)
    CSV.read("./db/gossips.csv").each_with_index.map {|line,index|
      [index, line]
    }.to_h[id]
  end

  def self.all
    CSV.read("./db/gossips.csv").map {|line|
    Gossip.new(line[0], line[1])
    }
  end




end
