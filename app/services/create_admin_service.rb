class CreateAdminService
  def call
    user = User.find_or_create_by!(:email => Rails.application.secrets.admin_email) do |users|
      users.name = Rails.application.secrets.admin_name
      users.account_number = Rails.application.secrets.admin_account_number
      users.password = Rails.application.secrets.admin_password
      users.password_confirmation = Rails.application.secrets.admin_password
      users.admin!
    end
  end
end