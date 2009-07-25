class Trunk < ActiveRecord::Base
  
  validates_presence_of :traceable,
        :message => "Please enter a traceable id"
  validates_presence_of :kind_id,
         :message => "Please select a species"
  validates_presence_of :loc_lat,
        :message => "Please enter a latitude"
  validates_presence_of :loc_lon,
        :message => "Please enter a longitude"
  validates_length_of :traceable, :is => 8,
        :message => "Traceable has 8 digits"
  validates_uniqueness_of :traceable,
        :message => "Traceable must be unique"

  belongs_to :kind
  has_many :process_trunks

  def scientific
    if kind == nil
      return 'kind fehlt'
    end
    kind.scientific
  end

  def portugues
    if kind == nil
      return 'kind fehlt'
    end
    kind.portugues
  end

    def picture
    if kind == nil
      return Kind.missing_picture
    end
    kind.picture
  end

end
