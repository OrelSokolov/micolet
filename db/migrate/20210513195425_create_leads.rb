class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :email
      t.boolean :womans_fashion
      t.boolean :mens_fashion
      t.boolean :children_fashion

      t.timestamps
    end
  end
end
