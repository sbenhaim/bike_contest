class Ride < DataMapper::Base
  belongs_to :biker
  
  property :date, :string
  property :notes, :string
  property :distance, :float
  
  def month
    self.date.match(/^\d{4}-(\d{2})/)[1]
  end
  
end