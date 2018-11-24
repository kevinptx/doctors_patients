class AddEducationToPhysician < ActiveRecord::Migration[5.2]
  def change
    add_column :physicians, :education, :string
  end
end
