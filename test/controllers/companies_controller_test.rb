require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { company_timezone: @company.company_timezone, fiscal_year: @company.fiscal_year, jurisdiction: @company.jurisdiction, name: @company.name, owner_email: @company.owner_email, owner_first_name: @company.owner_first_name, owner_last_name: @company.owner_last_name, owner_mobile_number: @company.owner_mobile_number, state_code: @company.state_code, subdomain: @company.subdomain, terms_and_condition_title: @company.terms_and_condition_title } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { company_timezone: @company.company_timezone, fiscal_year: @company.fiscal_year, jurisdiction: @company.jurisdiction, name: @company.name, owner_email: @company.owner_email, owner_first_name: @company.owner_first_name, owner_last_name: @company.owner_last_name, owner_mobile_number: @company.owner_mobile_number, state_code: @company.state_code, subdomain: @company.subdomain, terms_and_condition_title: @company.terms_and_condition_title } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
