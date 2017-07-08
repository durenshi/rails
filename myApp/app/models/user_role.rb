class UserRole < ApplicationRecord
  enum role_id: { 美术经理: 0, 美术制作: 1 ,美术接口人: 2 }

  include BelongsToUserConcern

end
