module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect
    end

    protected

      def find_verified_user #this is devise gem specific code
        if verified_user = request.env['warden'].user 
          verified_user
        else
          reject_unauthorized_connection # rails method to stop connection
        end
      end
  end
end