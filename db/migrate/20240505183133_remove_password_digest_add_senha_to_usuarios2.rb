class RemovePasswordDigestAddSenhaToUsuarios2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :password_digest, :string
    add_column :usuarios, :senha, :string
  end
end
