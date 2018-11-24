class AddDobToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :dob, :date
  end
end
