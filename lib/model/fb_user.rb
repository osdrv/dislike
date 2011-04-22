class FBUser
  include Mongoid::Document

  field :first_name
  field :last_name
  field :name
  field :gender
  field :fbid
  field :fblink
  field :access_token

  validates_uniqueness_of :fbid

  class << self
    def find_by_fbid(fbid)
      FBUser.first(:conditions => {:fbid => fbid})
    end
  end
end
