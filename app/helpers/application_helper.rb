module ApplicationHelper
    def avatar_url(writer, size: 80)     
        if(writer.present?)
            gravatar_id = Digest::MD5.hexdigest(writer.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        end
    end
end
