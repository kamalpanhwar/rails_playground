require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Company timezone", with: @company.company_timezone
    fill_in "Fiscal year", with: @company.fiscal_year
    fill_in "Jurisdiction", with: @company.jurisdiction
    fill_in "Name", with: @company.name
    fill_in "Owner email", with: @company.owner_email
    fill_in "Owner first name", with: @company.owner_first_name
    fill_in "Owner last name", with: @company.owner_last_name
    fill_in "Owner mobile number", with: @company.owner_mobile_number
    fill_in "State code", with: @company.state_code
    fill_in "Subdomain", with: @company.subdomain
    fill_in "Terms and condition title", with: @company.terms_and_condition_title
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Company timezone", with: @company.company_timezone
    fill_in "Fiscal year", with: @company.fiscal_year
    fill_in "Jurisdiction", with: @company.jurisdiction
    fill_in "Name", with: @company.name
    fill_in "Owner email", with: @company.owner_email
    fill_in "Owner first name", with: @company.owner_first_name
    fill_in "Owner last name", with: @company.owner_last_name
    fill_in "Owner mobile number", with: @company.owner_mobile_number
    fill_in "State code", with: @company.state_code
    fill_in "Subdomain", with: @company.subdomain
    fill_in "Terms and condition title", with: @company.terms_and_condition_title
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
