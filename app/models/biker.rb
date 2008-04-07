class Biker < DataMapper::Base
  has_many :rides
  
  property :first_name, :string
  property :last_name, :string
end