class AddZipToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :zip, :string
  end
end
