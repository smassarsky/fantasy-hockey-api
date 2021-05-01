class MatchupIndexSerializer
  include JSONAPI::Serializer

  belongs_to :owner, record_type: :user

  set_key_transform :camel_lower

  attributes :name, :start_date, :end_date, :status

end
