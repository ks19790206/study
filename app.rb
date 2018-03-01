require 'rubygems'
require 'bundler'

Bundler.require
set :database,{adapter: "sqlite3", database: "datas.sqlite3"}
enable :sessions

class Datas < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :adress
  validates_presence_of :tel
end

get '/' do
  erb :index
end

get '/staff_all' do
  @now=Time.now
  @data=Datas.all
  @message=session.delete :message
 erb :staff_all
end

get '/form_new' do
  @data=Datas.new
  erb :form
end

post '/datas' do
#p params
name = params[:name]
email = params[:email]
adress = params[:adress]
tel = params[:tel]
@data = Datas.new({name: name,email: email,adress: adress,tel: tel})
  if @data.save
    session[:message] = "#{name}さんを作成しました"
   redirect '/'
  else
   erb :form
 end
end
