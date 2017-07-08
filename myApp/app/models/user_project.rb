class UserProject < ApplicationRecord
  include BelongsToUserConcern
  belongs_to :project
end
