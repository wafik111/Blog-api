class Tag < ApplicationRecord
    belongs_to :post

    validates_presence_of :tag

end
