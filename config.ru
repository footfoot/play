require File.expand_path(File.dirname(__FILE__) + '/app/play')
require File.expand_path(File.dirname(__FILE__) + '/app/live-update')
require 'sprockets'


Faye::WebSocket.load_adapter('thin')

run Play.app
