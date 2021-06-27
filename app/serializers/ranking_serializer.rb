class RankingSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id, :song_id
  belongs_to :user, serializer: UserSerializer
end
