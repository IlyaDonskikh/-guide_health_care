require 'test_helper'

class Panel::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  fixtures :organizations

  setup do
    @organization = organizations(:one)
  end

  test 'index' do
    get panel_organizations_path

    assert_response :success
    Organization.all.page(1).per(15).each do |organization|
      assert_select 'td', organization.name
    end
  end

  test 'new' do
    get new_panel_organization_path

    assert_response :success
  end

  test 'create success' do
    name = 'test new name'
    assert_difference 'Organization.count', +1 do
      post panel_organizations_path, params: { organization: { name: name } }
    end

    assert_redirected_to panel_organizations_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.organizations.create.success')
    assert_select 'td', name
    assert_response :success
  end

  test 'create failure' do
    assert_no_difference 'Organization.count' do
      post panel_organizations_path, params: { organization: { name: '' } }
    end

    assert_select '#organization_name' do |input|
      assert_select input.first.parent, '.help-block', I18n.t('activerecord.errors.messages.blank')
    end
    assert_equal panel_organizations_path, path
  end

  test 'edit' do
    get edit_panel_organization_path(@organization)

    assert_response :success
  end

  test 'update success' do
    new_name = 'new test name'
    patch panel_organization_path(@organization), params: { organization: { name: new_name } }

    assert_redirected_to panel_organizations_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.organizations.update.success')
    assert_select 'td', new_name
    assert_response :success
  end

  test 'update failure' do
    patch panel_organization_path(@organization), params: { organization: { name: '' } }

    assert_select '#organization_name' do |input|
      assert_select input.first.parent, '.help-block', I18n.t('activerecord.errors.messages.blank')
    end
    assert_equal panel_organization_path(@organization), path
  end

  test 'destroy success' do
    assert_difference 'Organization.count', -1 do
      delete panel_organization_path(@organization)
    end

    assert_redirected_to panel_organizations_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.organizations.destroy.success')
    assert_select 'td', text: @organization.name, count: 0
    assert_response :success
  end
end
