class MatchupIndexSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :name, :start_date, :end_date, :status

  attributes :team do |object|
    object.team.full_team_name
  end

  attributes :owner do |object|
    object.owner.name
  end

end
