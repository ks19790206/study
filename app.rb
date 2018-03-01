require 'rubygems'
require 'bundler'

Bundler.require
set :database,{adapter: "sqlite3", database: "datas.sqlite3"}
enable :sessions

class Datas < ActiveRecord::Base
  validates_presence_of :name
end

get '/' do
  @now=Time.now
  @data=Datas.all
  @message=session.delete :message
  erb :index
end

get '/form_new' do
  @data=Datas.new
  erb :form
end

post '/datas' do

#p params
name = params[:name]
@data = Datas.new({name: name})
  if @data.save
    session[:message] = "#{name}さんを作成しました"
   redirect '/'
  else
   erb :form
 end
end
