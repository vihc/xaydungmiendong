class CreateImageTranslations < ActiveRecord::Migration

  def up
    Image.create_translation_table!({
      title: :string
    }, {
      migrate_data: true
    })
  end

  def down
    Image.drop_translation_table! migrate_data: true
  end


end
