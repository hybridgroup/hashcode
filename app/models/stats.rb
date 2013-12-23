class Stats
  include DataMapper::Resource

  property :id, Serial
  property :stats, Json
  property :created_at, DateTime

  def sorted_stats
    Hash[stats.sort_by { |_, count| count }.reverse]
  end

  class << self
    def last
      first :order => [ :created_at.desc ]
    end
  end
end
