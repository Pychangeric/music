class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do
    users = User.all
    users.to_json
  end

 
  get '/users' do
    users = User.all
    users.to_json
  end


  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end


  post '/users' do
    user_params = JSON.parse(request.body.read)
    user = User.new(user_params)

    if user.save
      { message: 'User created successfully', user: user }.to_json
    else
      { message: 'Failed to create user', errors: user.errors.full_messages }.to_json
    end
  end

 
  patch '/users/:id' do
    user = User.find(params[:id])
    user_params = JSON.parse(request.body.read)

    if user.update(user_params)
      { message: 'User updated successfully', user: user }.to_json
    else
      { message: 'Failed to update user', errors: user.errors.full_messages }.to_json
    end
  end


  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end


  get '/payments' do
    payments = Payment.all
    payments.to_json
  end

 
  get '/payments/:id' do
    payment = Payment.find(params[:id])
    payment.to_json
  end

  
  post '/payments' do
    payment_params = JSON.parse(request.body.read)
    payment = Payment.new(payment_params)

    if payment.save
      { message: 'Payment created successfully', payment: payment }.to_json
    else
      { message: 'Failed to create payment', errors: payment.errors.full_messages }.to_json
    end
  end

 
  patch '/payments/:id' do
    payment = Payment.find(params[:id])
    payment_params = JSON.parse(request.body.read)

    if payment.update(payment_params)
      { message: 'Payment updated successfully', payment: payment }.to_json
    else
      { message: 'Failed to update payment', errors: payment.errors.full_messages }.to_json
    end
  end

 
  delete '/payments/:id' do
    payment = Payment.find(params[:id])
    payment.destroy
    payment.to_json
  end

 
  get '/notes' do
    notes = Note.all
    notes.to_json
  end


  get '/notes/:id' do
    note = Note.find(params[:id])
    note.to_json
  end

 
  post '/notes' do
    note_params = JSON.parse(request.body.read)
    note = Note.new(note_params)

    if note.save
      { message: 'Note created successfully', note: note }.to_json
    else
      { message: 'Failed to create note', errors: note.errors.full_messages }.to_json
    end
  end


  patch '/notes/:id' do
    note = Note.find(params[:id])
    note_params = JSON.parse(request.body.read)

    if note.update(note_params)
      { message: 'Note updated successfully', note: note }.to_json
    else
      { message: 'Failed to update note', errors: note.errors.full_messages }.to_json
    end
  end

 
  delete '/notes/:id' do
    note = Note.find(params[:id])
    note.destroy
    note.to_json
  end
end
