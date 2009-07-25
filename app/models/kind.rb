class Kind < ActiveRecord::Base

  validates_presence_of :portugues
  validates_uniqueness_of :scientific,
        :message => "Scientific name must be unique"
  #validates_attachment_content_type :picture,
   # :content_type => ["image/jpeg", "image/png", "image/gif"],
    #:message => "Oops! Make sure you are uploading an image file."
  #validates_attachment_size :picture,
    #:less_than => 20.kilobytes,
    #:message => "Sorry, I don't accept pictures with more than 20 kB."

  has_many :trunks

  has_attached_file :picture,
        :styles => {  :medium => "150x150>",
                      :thumb => "80x80>" }

  def self.missing_picture
    Paperclip::Attachment.new('picture', self.new, Paperclip::Attachment.default_options())
  end

  def display_name
    scientific + ' (' + portugues + ')'
  end

end
