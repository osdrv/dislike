class Dislike
  include Mongoid::Document
  field :fb_uid
  field :url
  field :date

  validates_uniqueness_of :fb_uid, :context => :url

  class << self
    def user_voted?(fb_uid, url)
      Dislike.count(:conditions => { :fb_uid => fb_uid, :url => url }) > 0
    end
  end
end