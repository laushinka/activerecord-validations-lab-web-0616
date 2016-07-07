class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  # validates_inclusion_of :title, :in => ["Won't Believe", "Secret", "Top", "Guess"]
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  def clickbait
    clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if clickbaits.none? { |click| self.title.include?(click) }
        errors.add(:title, "Title is not clickbait enough.")
      end
    end
      # do |click|
      #   errors.add(:title, "Title is not clickbait enough.") unless self.title.include?(click)
  end
end
