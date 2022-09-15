json.extract! chat, :id, :chat_id, :chat_type, :name, :created_at, :updated_at
json.url api_chat_url(chat, format: :json)
