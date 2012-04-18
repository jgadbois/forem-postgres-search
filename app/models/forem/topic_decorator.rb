Forem::Topic.class_eval do
  require 'pg_search'
  include PgSearch
  pg_search_scope :search, against: [:subject],
   using: {tsearch: {dictionary: "english"}},
   associated_against: {posts: [:text]}
end