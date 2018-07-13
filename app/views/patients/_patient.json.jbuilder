json.extract! patient, :id, :name, :phone_number, :created_at, :updated_at
json.url patient_url(patient, format: :json)
