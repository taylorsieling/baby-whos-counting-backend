class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :rankings, serializer: RankingSerializer
end
