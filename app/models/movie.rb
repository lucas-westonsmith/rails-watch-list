class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    raise ActiveRecord::InvalidForeignKey, 'Cannot delete movie with associated bookmarks' if bookmarks.exists?
  end
end
