class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :length
  belongs_to :album, serializer: AlbumSerializer
end
