class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :profile_img_url, :spotify_id, :spotify_url, :access_token, :refresh_token, :email
  has_many :rankings, serializer: RankingSerializer
end