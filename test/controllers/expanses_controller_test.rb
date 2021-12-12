# frozen_string_literal: true

require 'test_helper'

class ExpansesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expanse = expanses(:one)
  end

  test 'should get index' do
    get expanses_url
    assert_response :success
  end

  test 'should get new' do
    get new_expanse_url
    assert_response :success
  end

  test 'should create expanse' do
    assert_difference('Expanse.count') do
      post expanses_url,
           params: { expanse: { amount: @expanse.amount, created_by_id: @expanse.created_by_id, status: @expanse.status,
                                title: @expanse.title, type: @expanse.type } }
    end

    assert_redirected_to expanse_url(Expanse.last)
  end

  test 'should show expanse' do
    get expanse_url(@expanse)
    assert_response :success
  end

  test 'should get edit' do
    get edit_expanse_url(@expanse)
    assert_response :success
  end

  test 'should update expanse' do
    patch expanse_url(@expanse),
          params: { expanse: { amount: @expanse.amount, created_by_id: @expanse.created_by_id, status: @expanse.status,
                               title: @expanse.title, type: @expanse.type } }
    assert_redirected_to expanse_url(@expanse)
  end

  test 'should destroy expanse' do
    assert_difference('Expanse.count', -1) do
      delete expanse_url(@expanse)
    end

    assert_redirected_to expanses_url
  end
end
