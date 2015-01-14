class AddDataToRoles < ActiveRecord::Migration
  def change
      Role.create(role_name: 'admin')
      Role.create(role_name: 'user')
      Role.create(role_name: 'guest')
  end
end
