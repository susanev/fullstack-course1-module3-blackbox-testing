# Capybara.default_driver = :selenium
Capybara.default_driver = :poltergeist

Capybara.app_host = "http://search-coursera-example02.herokuapp.com/"

describe "Coursera App" do

  describe "visit root" do
  	before { visit '/' }
    
    it "displays 'Computer' (default)" do
      expect(page).to have_content 'Computer'
    end

    it "displays table element that has a row with 3 columns" do
      expect(page).to have_selector(:xpath, "//table//tr[count(td)=3]")
    end

    it "column 1 should have the thumbnail inside img tag" do
      expect(page).to have_selector(:xpath, "//table//tr/td[1]//img")
    end
  end

  it "displays 'The Meat We Eat' when looking_for=diet" do
    visit "?looking_for=diet"
    expect(page).to have_content 'The Meat We Eat'  	
  end

end