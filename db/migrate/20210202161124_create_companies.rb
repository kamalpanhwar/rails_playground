class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :subdomain
      t.string :owner_first_name
      t.string :owner_last_name
      t.string :owner_email
      t.string :owner_mobile_number
      t.string :state_code
      t.string :fiscal_year
      t.string :company_timezone
      t.string :terms_and_condition_title
      t.string :jurisdiction

      t.timestamps
    end
  end
end
