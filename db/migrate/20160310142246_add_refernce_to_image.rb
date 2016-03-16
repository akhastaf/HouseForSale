class AddRefernceToImage < ActiveRecord::Migration
  def change
    add_reference :images, :house, index: true, foreign_key: true
  end
end
