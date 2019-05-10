class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :category, :message, :created_at
end
