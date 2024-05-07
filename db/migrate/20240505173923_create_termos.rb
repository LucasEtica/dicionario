class CreateTermos < ActiveRecord::Migration[7.0]
  def change
    create_table :termos do |t|
      t.string :titulo
      t.string :descricao
      t.integer :usuario_id

      t.timestamps
    end
  end
end
