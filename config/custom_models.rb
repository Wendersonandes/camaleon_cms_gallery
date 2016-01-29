CamaleonCms::Site.class_eval do
  has_many :galleries, :class_name => "Plugins::Gallery::Gallery", dependent: :destroy
end
