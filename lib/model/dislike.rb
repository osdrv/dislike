class Dislike
  include Mongoid::Document
  field :fb_uid
  field :url
  field :date

  validates_uniqueness_of :fb_uid, :scope => :url
  validates_presence_of :fb_uid, :url

  class << self
    def user_vote(fb_uid, url)
      Dislike.find(:first, :conditions => { :fb_uid => fb_uid, :url => url })
    end

    def user_voted?(fb_uid, url)
      Dislike.count(:conditions => { :fb_uid => fb_uid, :url => url }) > 0
    end

    def count_for_url(url)
      Dislike.count(:conditions => { :url => url })
    end
  end
end
