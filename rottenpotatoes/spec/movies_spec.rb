require 'rails_helper'

RSpec.describe Movie, :type => :model do
  before do
    Movie.create!(:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25')
    Movie.create!(:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25')
    Movie.create!(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
    Movie.create!(:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11')
  end

  describe "find movies with same director" do
    it "should find movies with same director" do
      Movie.where(director: Movie.where(:title => "Star Wars")[0].director).each do |mv|
        expect(mv.director).to eq(Movie.where(:title => "Star Wars")[0].director)
      end
    end

    it "should not find anything if director is empty or nil" do
      Movie.where(director: Movie.where(:title => "Alien")[0].director).each do |mv|
        expect(mv).to eq(Movie.where(:title => "Alien")[0])
      end
    end
  end
end 