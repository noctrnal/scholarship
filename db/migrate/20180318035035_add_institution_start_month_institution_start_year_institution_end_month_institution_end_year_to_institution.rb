class AddInstitutionStartMonthInstitutionStartYearInstitutionEndMonthInstitutionEndYearToInstitution < ActiveRecord::Migration[5.0]
  def change
    add_column :institutions, :institution_start_month, :integer
    add_column :institutions, :institution_start_year, :integer
    add_column :institutions, :institution_end_month, :integer
    add_column :institutions, :institution_end_year, :integer
  end
end
