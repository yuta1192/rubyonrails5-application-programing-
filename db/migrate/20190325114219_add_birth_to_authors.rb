class AddBirthToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :birth, :date
  end
end
