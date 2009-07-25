class Kind < ActiveRecord::Base

  validates_presence_of :portugues
  validates_uniqueness_of :scientific,
        :message => "Scientific name must be unique"

  has_many :trunks

  has_attached_file :picture,
        :styles => { :medium => "150x150>",
        :thumb => "80x80>" }

  def self.missing_picture
    Paperclip::Attachment.new('picture', Kind.new, Paperclip::Attachment.default_options())
  end

  def display_name
    scientific + ' (' + portugues + ')'
  end

end
