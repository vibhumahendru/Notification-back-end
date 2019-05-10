class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
    render json: @notifications
  end

  # def create
  #   @notification = Notifcation.create({category: params[:category], messages: params[:message]})
  #   render json: @notification
  # end
  def create
    
   notification = Notification.new({category: params[:category], message: params[:message]})
   if notification.save
     serialized_data = ActiveModelSerializers::Adapter::Json.new(
       NotificationSerializer.new(notification)
     ).serializable_hash
     ActionCable.server.broadcast 'notifications_channel', serialized_data
     head :ok
   end
 end
end
