class Sale < ActiveRecord::Base
	
	before_create :generate_guid

	belongs_to :content

	private
	  def generate_guid
	  	def.guid = SecyreRandom.uuid()
	  end
end
