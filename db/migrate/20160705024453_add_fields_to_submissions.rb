class AddFieldsToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :first_name, :string
    add_column :submissions, :middle_name, :string
    add_column :submissions, :last_name, :string
    add_column :submissions, :permanent_address, :string
    add_column :submissions, :permanent_city, :string
    add_column :submissions, :permanent_state, :string
    add_column :submissions, :permanent_zip, :integer
    add_column :submissions, :permanent_phone, :integer, :limit => 9
    add_column :submissions, :current_address, :string
    add_column :submissions, :current_city, :string
    add_column :submissions, :current_state, :string
    add_column :submissions, :current_zip, :integer
    add_column :submissions, :current_phone, :integer, :limit => 9
    add_column :submissions, :citizen, :boolean
    add_reference :submissions, :field, foreign_key: true
    add_column :submissions, :field_explanation, :text
    add_reference :submissions, :degree, foreign_key: true
    add_column :submissions, :degree_explanation, :text
    add_column :submissions, :institution_name, :string
    add_column :submissions, :institution_city, :string
    add_column :submissions, :institution_state, :string
    add_column :submissions, :acceptance, :boolean
    add_column :submissions, :start_month, :integer
    add_column :submissions, :start_year, :integer
    add_column :submissions, :last_year, :boolean
    add_column :submissions, :last_year_explanation, :text
    add_column :submissions, :summer_tuition, :integer
    add_column :submissions, :summer_books, :integer
    add_column :submissions, :summer_board, :integer
    add_column :submissions, :summer_other, :integer
    add_column :submissions, :summer_hours, :integer
    add_column :submissions, :fall_tuition, :integer
    add_column :submissions, :fall_books, :integer
    add_column :submissions, :fall_board, :integer
    add_column :submissions, :fall_other, :integer
    add_column :submissions, :fall_hours, :integer
    add_column :submissions, :winter_tuition, :integer
    add_column :submissions, :winter_books, :integer
    add_column :submissions, :winter_board, :integer
    add_column :submissions, :winter_other, :integer
    add_column :submissions, :winter_hours, :integer
    add_column :submissions, :spring_tuition, :integer
    add_column :submissions, :spring_books, :integer
    add_column :submissions, :spring_board, :integer
    add_column :submissions, :spring_other, :integer
    add_column :submissions, :spring_hours, :integer
    add_column :submissions, :frequency, :string
    add_column :submissions, :motivation, :text
  end
end
