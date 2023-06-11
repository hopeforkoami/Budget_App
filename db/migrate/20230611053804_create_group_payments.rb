class CreateGroupPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :group_payments do |t|

      t.timestamps
    end
  end
end
