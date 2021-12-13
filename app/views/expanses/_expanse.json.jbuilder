# frozen_string_literal: true

json.extract! expanse, :id, :title, :amount, :type, :status, :created_by_id, :created_at, :updated_at
json.url expanse_url(expanse, format: :json)
