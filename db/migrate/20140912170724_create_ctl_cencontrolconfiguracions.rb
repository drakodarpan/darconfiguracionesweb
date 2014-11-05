class CreateCtlCencontrolconfiguracions < ActiveRecord::Migration
  def change
    create_table :ctl_cencontrolconfiguracions do |t|
      t.integer :num_valor1,     default: 0
      t.string :nom_valor2,      default: ""
      t.text :des_descripcion,   default: ""
      
      # References User
      t.references :account_number, index: true

      t.timestamps
    end
  end
end
