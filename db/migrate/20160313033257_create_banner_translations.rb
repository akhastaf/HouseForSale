class CreateBannerTranslations < ActiveRecord::Migration
  def change
    drop_table :banner_translations
  end
end
