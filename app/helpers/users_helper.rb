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

end
