Forem::Topic.class_eval do
    #include PgSearch
    #pg_search_scope :search, against: [:subject],
    # using: {tsearch: {dictionary: "english"}},
    # associated_against: {posts: [:text]},
    # ignoring: :accents
end