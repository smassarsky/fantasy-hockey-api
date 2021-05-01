class MatchupSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :username, :name

end
