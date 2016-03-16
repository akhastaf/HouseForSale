class CreateHouseTranslations < ActiveRecord::Migration
  def up
    House.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    House.drop_translation_table! migrate_data: true
  end
end
