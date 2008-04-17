class Biker < DataMapper::Base
  has_many :rides
  
  property :first_name, :string, :nullable => false
  property :last_name, :string, :nullable => false
  property :username, :string, :nullable => false
  property :password, :string, :nullable => false
  property :miles_public, :boolean
  
  def miles( period )
    if (period == 'total')
      self.rides.map {|r| r.distance }.inject { |sum, dist| sum + dist } || 0.0
    else
      self.rides.map {|r| r.distance if r.date.match(/^\d{4}-(\d{2})/)[1] == period }.compact.inject { |sum, dist| sum + dist } || 0.0
    end
  end
  
  def place(period)
    Biker.all.map {|biker| biker.miles(period)}.sort.reverse.index(self.miles(period)) + 1
  end
  
end