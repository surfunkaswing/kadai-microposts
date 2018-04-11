class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :favorites
  has_many :liked, through: :favorites, source: :user
  
#  def fans
#    @micropost = Micropost.find(params[:id])
#    @funs = @micropost.liked.page(params[:page])
#    liked_counts(@user)
#  end
end