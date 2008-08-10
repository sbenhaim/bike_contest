class Ride
  include DataMapper::Resource
  
  belongs_to :biker
  
  property :id, Integer,    :serial => true
  property :date, String, :nullable => false
  property :notes, String
  property :distance, Float, :nullable => false
  
  def month
    self.date.match(/^\d{4}-(\d{2})/)[1]
  end
  
end
