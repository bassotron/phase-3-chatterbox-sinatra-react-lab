class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    messages = Message.created_at
    messages.to_json
  end
  
post '/messages' do
  messages = Message.create(body:params[:body], username:params[:username])
  messages.to_json
end

patch '/messages/:id' do  
  messages = Message.find(params[:id])
  messages.update(body:params[:body])
  messages.to_json
end

delete '/messages/:id' do
  messages = Message.destroy(params[:id])
  messages.to_json
end
end
