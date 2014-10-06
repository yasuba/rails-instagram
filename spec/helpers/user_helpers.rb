module UserHelpers

  def sign_up
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "andrew@gmail.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Sign up"
  end

  def sign_in
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "maya@gmail.com"
    fill_in "Password", with: "secretpassword"
    click_button "Log in"
  end

  def post_photo
    click_link "Post a photo"
    attach_file("Image", "spec/features/breakfast.jpg")
    fill_in "Description", with: "A photo of my breakfast"
    click_button "Submit photo"
  end

end