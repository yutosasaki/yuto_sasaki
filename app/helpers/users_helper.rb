module UsersHelper

  IMAGE = 'test/images'.freeze
  IMAGE_URL = 'test/images/u'.freeze
  IMAGE_LEFT = 'image to left.'.freeze
  IMAGE_RIGHT = 'image to right.'.freeze
  ONLY_RIGHT = 'only right.'.freeze


  def user_link
    render partial: 'shared/custom_about'
  end

  def image_tags
    image_left = [ IMAGE_LEFT, IMAGE_RIGHT ].sample(1)
    @top_images = { image_left: image_left, only_right: ONLY_RIGHT, image_url: IMAGE_URL}
  end

  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
