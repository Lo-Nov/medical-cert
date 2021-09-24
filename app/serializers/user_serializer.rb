class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :phone, :usertype, :password_digest
end
