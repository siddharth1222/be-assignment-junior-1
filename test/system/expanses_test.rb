# frozen_string_literal: true

require 'application_system_test_case'

class ExpansesTest < ApplicationSystemTestCase
  setup do
    @expanse = expanses(:one)
  end

  test 'visiting the index' do
    visit expanses_url
    assert_selector 'h1', text: 'Expanses'
  end

  test 'creating a Expanse' do
    visit expanses_url
    click_on 'New Expanse'

    fill_in 'Amount', with: @expanse.amount
    fill_in 'Created by', with: @expanse.created_by_id
    check 'Status' if @expanse.status
    fill_in 'Title', with: @expanse.title
    fill_in 'Type', with: @expanse.type
    click_on 'Create Expanse'

    assert_text 'Expanse was successfully created'
    click_on 'Back'
  end

  test 'updating a Expanse' do
    visit expanses_url
    click_on 'Edit', match: :first

    fill_in 'Amount', with: @expanse.amount
    fill_in 'Created by', with: @expanse.created_by_id
    check 'Status' if @expanse.status
    fill_in 'Title', with: @expanse.title
    fill_in 'Type', with: @expanse.type
    click_on 'Update Expanse'

    assert_text 'Expanse was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Expanse' do
    visit expanses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Expanse was successfully destroyed'
  end
end
