require 'csv'


class Gossip
	attr_reader :author,  :content, :comments

	def initialize(author, content, comments = [])
	  @author = author
	  @content = content
	  @comments = comments
	end

	#Méthode pour enregistrer un gossip
	def save 
		CSV.open("db/gossip.csv", "a+") do |csv|
			csv << [@author, @content, @comments.join("|")]
		end
	end

	#Methode pour ajouter un commentaire sur le gossip avec l'id demandé
	def self.add_comment(id, comment)
		table = CSV.read("./db/gossip.csv")
		index = id.to_i
		if table[index][2] != nil
			comment_table = table[index][2].split("|")
		else
			comment_table = []
		end
		comment_table << comment
		table[index][2] = comment_table.join("|")
		CSV.open("./db/gossip.csv", "w") do |csv|
			table.each do |gossip|
				csv << gossip
			end
		end
	end

	#Methode pour retourner la liste des commentaires
  def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
  		if csv_line[2] != nil
				comment_table = csv_line[2].split("|")
			else
				comment_table = []
			end
    	all_gossips << Gossip.new(csv_line[0], csv_line[1], comment_table)
  	end
		return all_gossips
	end

	#Methode pour retourner le commentaire à l'indice "id"
	def self.find(id)
		return self.all[id.to_i]
	end

	#Methode pour modifier un commentaire
	def self.update(id, author, content)
		table = CSV.read("./db/gossip.csv")
		index = id.to_i
		table[index][0] = author
		table[index][1] = content
		CSV.open("./db/gossip.csv", "w") do |csv|
			table.each do |gossip|
				csv << gossip
			end
		end
	end
end
