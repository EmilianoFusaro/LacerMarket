class Content < ActiveRecord::Base
	belongs_to :user
    #cover può cambiare come nome
	#has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    # è stato tolto il default dell'immagine
    has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
