class ProcessTrunk < ActiveRecord::Base

  validates_presence_of :trunk_id

  belongs_to :trunk

  def kind
    trunk.kind
  end

  def traceable
    if trunk == nil
      return 'trunk fehlt'
    end
    trunk.traceable
  end

end
