class Ride < DataMapper::Base
  belongs_to :biker
  
  property :date, :datetime
  property :type, :string
  property :distance, :float
end