class AddSpecialtyToPhysician < ActiveRecord::Migration[5.2]
  def change
    add_column :physicians, :specialty, :string
  end
end
