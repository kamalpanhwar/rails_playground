json.extract! company, :id, :name, :subdomain, :owner_first_name, :owner_last_name, :owner_email, :owner_mobile_number, :state_code, :fiscal_year, :company_timezone, :terms_and_condition_title, :jurisdiction, :created_at, :updated_at
json.url company_url(company, format: :json)
