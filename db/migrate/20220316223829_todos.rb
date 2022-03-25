class Todos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :task
      t.boolean :completed, default:false 
      t.timestamps
      t.belongs_to :user
    end
  end
end
