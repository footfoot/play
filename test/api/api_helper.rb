require File.expand_path("../../helper", __FILE__)

Play.config['auth_token'] = '123456789'

def valid_user
  User.create(:login => 'tater', :email => 'tater@github.com')
end

def authorized_rack_env_for(user)
  {"HTTP_AUTHENTICATION" => user.token}
end

def authorized_get(uri, user, opts={})
  get uri, opts, authorized_rack_env_for(user)
end

def authorized_post(uri, user, opts={})
  post uri, opts, authorized_rack_env_for(user)
end

def authorized_put(uri, user, opts={})
  put uri, opts, authorized_rack_env_for(user)
end

def authorized_delete(uri, user, opts={})
  delete uri, opts, authorized_rack_env_for(user)
end

def unauthorized_get(uri, opts={})
  rack_env = {"HTTP_AUTHENTICATION" => "xxxxxxxxxxxxxxxxxx"}
  get uri, opts, rack_env
end

def assert_json(response)
  assert_equal 'application/json;charset=utf-8', response.headers["Content-Type"]
end

def parse_response(response)
  Yajl::load(response.body)
end
