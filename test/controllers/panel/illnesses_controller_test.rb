require 'test_helper'

class Panel::IllnessesControllerTest < ActionDispatch::IntegrationTest
  fixtures :illnesses

  setup do
    @illness = illnesses(:one)
  end

  test 'index' do
    get panel_illnesses_path

    assert_response :success
    Illness.all.page(1).per(15).each do |illness|
      assert_select 'td', illness.name
    end
  end

  test 'new' do
    get new_panel_illness_path

    assert_response :success
  end

  test 'create success' do
    name = 'test new name'
    assert_difference 'Illness.count', +1 do
      post panel_illnesses_path, params: { illness: { name: name } }
    end

    assert_redirected_to panel_illnesses_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.illnesses.create.success')
    assert_select 'td', name
    assert_response :success
  end

  test 'create failure' do
    assert_no_difference 'Illness.count' do
      post panel_illnesses_path, params: { illness: { name: '' } }
    end

    assert_select '#illness_name' do |input|
      assert_select input.first.parent, '.help-block', I18n.t('activerecord.errors.messages.blank')
    end
    assert_equal panel_illnesses_path, path
  end

  test 'edit' do
    get edit_panel_illness_path(@illness)

    assert_response :success
  end

  test 'update success' do
    new_name = 'new test name'
    patch panel_illness_path(@illness), params: { illness: { name: new_name } }

    assert_redirected_to panel_illnesses_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.illnesses.update.success')
    assert_select 'td', new_name
    assert_response :success
  end

  test 'update failure' do
    patch panel_illness_path(@illness), params: { illness: { name: '' } }

    assert_select '#illness_name' do |input|
      assert_select input.first.parent, '.help-block', I18n.t('activerecord.errors.messages.blank')
    end
    assert_equal panel_illness_path(@illness), path
  end

  test 'destroy success' do
    assert_difference 'Illness.count', -1 do
      delete panel_illness_path(@illness)
    end

    assert_redirected_to panel_illnesses_path

    follow_redirect!
    assert_select '.alert-success div', I18n.t('panel.illnesses.destroy.success')
    assert_select 'td', text: @illness.name, count: 0
    assert_response :success
  end
end
