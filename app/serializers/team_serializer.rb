class TeamSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :name, &:full_team_name

end
