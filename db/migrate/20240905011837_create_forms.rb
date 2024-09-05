class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :gender
      t.string :email
      t.string :phonenumber
      t.string :subject

      t.timestamps
    end
  end
end
