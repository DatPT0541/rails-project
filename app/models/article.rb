class Article < ApplicationRecord
  belongs_to :user

  after_commit :set_hash_id, on: :create

  HASHIDS = Hashids.new("your_salt_here", 30)

  def hashed_id
    HASHIDS.encode(id)
  end

  def self.find_by_hashed_id hash
    id = HASHIDS.decode(hash).first
    find_by(id:) if id
  end

  private

  def set_hash_id
    update_column(:hash_id, hashed_id)
  end
end
