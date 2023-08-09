class CreateProyects < ActiveRecord::Migration[7.0]
  def change
    create_table :proyects do |t|

      t.timestamps
    end
  end
end
