require File.expand_path('../../app/models/forem/topic', Forem::Engine.called_from)
module Forem
  class Topic < ActiveRecord::Base
    #include PgSearch
    #pg_search_scope :search, against: [:subject],
    # using: {tsearch: {dictionary: "english"}},
    # associated_against: {posts: [:text]},
    # ignoring: :accents
  end
end