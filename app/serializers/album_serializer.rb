class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year
  has_many :songs, serializer: SongSerializer
end
