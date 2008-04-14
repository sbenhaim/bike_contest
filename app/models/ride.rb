class Ride < DataMapper::Base
  belongs_to :biker
  
  property :date, :string
  property :notes, :string
  property :distance, :float
end