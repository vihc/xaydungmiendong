class CreateProductTranslations < ActiveRecord::Migration
    def up
    Product.create_translation_table!({
      name: :string,
      description: :text,
      summary_description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Product.drop_translation_table! migrate_data: true
  end
end
