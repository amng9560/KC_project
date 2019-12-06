class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :firstname, :lastname
end
