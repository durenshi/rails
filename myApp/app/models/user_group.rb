class UserGroup < ApplicationRecord
  include BelongsToUserConcern
  belongs_to :group
end
