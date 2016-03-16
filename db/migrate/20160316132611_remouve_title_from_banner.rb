class RemouveTitleFromBanner < ActiveRecord::Migration
  def change
    remove_column :banner, :title
  end
end
