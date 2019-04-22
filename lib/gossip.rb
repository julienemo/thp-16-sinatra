require "bundler"
Bundler.require

class Gossip
  def save
    CSV.open("./db/gossips.csv", "ab") do |csv|
      csv << ["Mon super auteur", "Ma super description"]
    end
  end
end
