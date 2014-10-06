class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :write_a_comment

      t.timestamps
    end
  end
end
