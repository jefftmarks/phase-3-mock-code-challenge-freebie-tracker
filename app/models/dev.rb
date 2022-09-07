class Dev < ActiveRecord::Base
	has_many :freebies
	has_many :companies, through: :freebies

	def received_one?(item_name)
		self.freebies.pluck("item_name").include?(item_name)
	end

	def give_away(dev, freebie)
		if self.id == freebie.dev_id
			freebie.update(dev_id: dev.id)
		else
			puts "You got nothing to give away!"
		end
	end
end


