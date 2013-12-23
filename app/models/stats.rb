class Stats
  include DataMapper::Resource

  property :id, Serial
  property :stats, Json
  property :created_at, DateTime

  class << self
    def last
      first :order => [ :created_at.desc ]
    end
  end
end
