class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.email :string
      t.password_digest :string

      t.timestamps
    end
  end
end
