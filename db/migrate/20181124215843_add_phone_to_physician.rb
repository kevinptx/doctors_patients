class AddPhoneToPhysician < ActiveRecord::Migration[5.2]
  def change
    add_column :physicians, :phone, :string
  end
end
