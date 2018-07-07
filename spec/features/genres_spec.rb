require 'rails_helper'

RSpec.feature "Genres", type: :feature do
  before do
    @user = User.create!(email: "a@a.com", password: "hi", password_confirmation: "hi")
    Genre.create!(
      name: "Poop",
      image: "drawing.png",
      text: "art created using pencils and other precision drawing utencils."
    )
    Genre.create!(
      name: "photography",
      image: "photography.png",
      text: "art created using cameras or light-capturing devices."
    )
    Genre.create!(
      name: "fashion",
      image: "fashion.png",
      text: "art created involving the pairing of different colors, fabrics, and sizes on the human body."
    )
    Genre.create!(
      name: "graphic design",
      image: "graphic_design.png",
      text: "art created using digital forms like computers."
    )
    Genre.create!(
      name: "painting",
      image: "painting.png",
      text: "art created using physical materials like acrylic or watercolor."
    )
    Genre.create!(
      name: "sculpture",
      image: "sculpture.png",
      text: "art created molding different types of earth."
    )
  end
  context 'create new selector' do
    scenario 'before browser refresh' do 
      visit login_path
      within("form") do
        fill_in 'Email', with: 'a@a.com'
        fill_in 'Password', with: 'hi'
      end
      click_button "Log In"
      visit root_url
      within(:css, 'table') do
        click_link('drawing')
        click_link('photography')
        click_link('choose')
        expect(Genre.first).to eq(4)
        expect(User.all.length).to eq(1)
        # expect(page).to have_css('td#drawing div.total-image-text-container.elevated')
      end
    end

    scenario 'after browser refresh' do 
      visit login_path
      within("form") do
        fill_in 'Email', with: 'a@a.com'
        fill_in 'Password', with: 'hi'
      end
      click_button "Log In"
      visit root_url
      within(:css, 'table') do
        click_link('drawing')
        click_link('photography')
        click_link('choose')
      end
      visit root_url
      page.has_css?('td#drawing div.total-image-text-container.elevated')
      page.has_css?('td#photography div.total-image-text-container.elevated')
    end

  context 'remove selector' do
    scenario 'after post' do
      visit login_path
      within("form") do
        fill_in 'Email', with: 'a@a.com'
        fill_in 'Password', with: 'hi'
      end
      click_button "Log In"
      visit root_url
      within(:css, 'table') do
        click_link('drawing')
        click_link('photography')
        click_link('choose')
      end

      visit root_url
      within(:css, 'table') do
        click_link('drawing')
        click_link('photography')
        click_link('choose')
      end
      page.has_css?('td#drawing div.total-image-text-container.elevated')
    end
  end

  #   scenario 'after browser refresh' do
  #     visit signup_path
  #     within("form") do
  #       fill_in 'Email', with: 'a@a.com'
  #       fill_in 'Password', with: 'hi'
  #       fill_in 'Password confirmation', with: 'hi'
  #     end
  #     click_button "Sign Up"
  #     visit root_url
  #     within("form") do
  #       fill_in 'Email', with: 'a@a.com'
  #       fill_in 'Password', with: 'hi'
  #     end
  #     click_button "Log In"
  #     visit root_url
  #     within(:css, 'table') do
  #       click_link((".image-text")[0])
  #       click_link((".image-text")[1])
  #       click_link("#post")
  #     end


  #     visit root_url
  #     within(:css, 'table') do
  #       click_link((".image-text")[0])
  #       click_link((".image-text")[1])
  #       click_link("#post")
  #     end
  #     page.evaluate_script("window.location.reload()")
  #     expect(".total-image-text-container"[0]).to have_no_content(".definition")
  #     expect(".total-image-text-container"[1]).to have_no_content(".definition")
  #   end
  end
end
