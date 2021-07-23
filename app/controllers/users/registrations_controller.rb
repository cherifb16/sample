class Users::RegistrationsController < Devise::RegistrationsController
    def build_resource(hash={})
      hash[:uid] = User.create_unique_string
      self.resource = resource_class.new_with_session(hash || {}, session)
      super
    end
  end
