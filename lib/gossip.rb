require "bundler"
Bundler.require

class Gossip
  attr_accessor :author, :content

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
    CSV.read("./db/gossips.csv")[id]
  end

  def self.all
    CSV.read("./db/gossips.csv").map {|line|
    Gossip.new(line[0], line[1])
    }
  end

  def self.update(author, content, index)
    all = CSV.read("./db/gossips.csv")
    all[index] = [author, content]

    file = CSV.open("./db/gossips.csv", "w")
    all.each do |gossip|
      file.puts(gossip)
    end
    file.close
    p CSV.read("./db/gossips.csv")
  end
end
