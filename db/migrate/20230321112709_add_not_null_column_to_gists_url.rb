class AddNotNullColumnToGistsUrl < ActiveRecord::Migration[7.0]
  def change
    change_column_null :gists, :gist_url, false
  end
end
