module UsersHelper
# Returns the Gravatar (http://gravatar.com/) for the given user.
def gravatar_for(user)
gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
image_tag(gravatar_url, alt: user.name, class: "gravatar")
end

def gravatar_for_with_size(user, s)
                gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
                gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
                image_tag(gravatar_url, alt: user.name, class: "gravatar", size: s)
        end

end
