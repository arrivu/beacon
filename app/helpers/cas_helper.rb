module CasHelper

    class LoginResponse
      attr_accessor :type, :tgt, :msg

      def initialize(params)
        attrs = %w(type tgt)
        attrs.each { |attr| self.instance_variable_set("@#{attr}", params[attr]) }
        message = params["message"]
        @msg = message["untranslated_path"]
      end
    end

    def cas_sign_in(user)
      loginResponse = login(user.email, user.encrypted_password)
      tgt = loginResponse.tgt
    end

    #def cas_sign_out(user)
    #
    #  logout(tgt) if tgt
    #  #cookies.delete('tgt')
    #end

    def cas_sign_out_tgt(tgt)
      logout(tgt) if tgt
    end

    def cas_enable?
      parse_boolean "#{Settings.cas.enable}"
    end

    private

        def login_url
          "#{Settings.cas.url}#{Settings.cas.login_path}"
        end

        def logout_url
          "#{Settings.cas.url}#{Settings.cas.logout_path}"
        end

        def parse_boolean(value)
          [true, 'true', 1, '1', 't'].include?(value.respond_to?(:downcase) ? value.downcase : value)
        end

        def login(username, password)
          #puts login_url
          response_bytes =  RestClient::Request.execute(:method => :post, :url => login_url,
                                                        :payload => {:username => username, :password => password} )
          response_json =JSON.parse(response_bytes)
          #puts response_json
          LoginResponse.new(response_json)
        end

        def logout(tgt)
          response_bytes =  RestClient.delete(logout_url, {:cookies => {:tgt => "#{tgt}"}})
          json = JSON.parse(response_bytes)
          #puts json
          message = json["message"]
          message["untranslated_path"]
        end
end