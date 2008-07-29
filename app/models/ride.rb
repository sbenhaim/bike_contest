class Ride < DataMapper::Base
  belongs_to :biker
  
  property :date, :string, :nullable => false
  property :notes, :string
  property :distance, :float, :nullable => false
  
  def month
    self.date.match(/^\d{4}-(\d{2})/)[1]
  end
  
end
