require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'nikcochran'
    fill_in 'Email', with: 'nikcochran@gmail.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do

    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'user name must be more than 4 characters long' do
    fill_in 'User name', with: 'h'
    fill_in 'Email', with: 'nikcochran@gmail.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end
  #
  # scenario 'can log out once logged in' do
  #   visit '/'
  #   click_link 'Login'
  #   fill_in 'Email', with: 'nikcochran@gmail.com'
  #   fill_in 'Password', with: 'supersecret'
  #   click_button 'Log in'
  #
  #   click_link 'Logout'
  #   expect(page).to have_content('You need to sign in or sign up before continuing.')
  # end


  scenario 'sign in to view posts' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
