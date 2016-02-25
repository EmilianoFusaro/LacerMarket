class Content < ActiveRecord::Base

    extend FriendlyId   #per usare la gemma link
    friendly_id :titolo, use: :slugged


	belongs_to :user
    #cover può cambiare come nome
	#has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    # è stato tolto il default dell'immagine
    has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/,
    message:"formato non supportato"

    #gestione allegato
    has_attached_file :allegato
    validates_attachment_content_type :allegato, content_type: [/^image\/(png|gif|jpeg)/,'application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powepoint'],
    message:"formato non supportato"


    validates :titolo, :descrizione, :price, presence: true
    validates :price, numericality: {greater_than: 0 }

    validates :cover, attachment_presence: true
    validates :allegato, attachment_presence: true


end
