class AddStatusToDoctorAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :doctor_appointments, :status, :integer, :default => 0
  end
end
