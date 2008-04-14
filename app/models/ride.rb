class Ride < DataMapper::Base
  belongs_to :biker
  
  property :date, :datetime
  property :notes, :string
  property :distance, :float
end