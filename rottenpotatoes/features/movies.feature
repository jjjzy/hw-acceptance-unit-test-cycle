Feature: Managing movies

  As a movie collector
  So that I can collect movies and save them into a database
  I want to view my collection and information about each Movie

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add new movies into the database
  When I go to the new movie page
  And  I fill in "Title" with "The Mainframe"
  And  I fill in "Director" with "Awesome Director"
  And  I select "G" from "Rating"
  And  I press "Save Changes"
  Then I should see "The Mainframe"
  And  I should see "Awesome Director"

Scenario: view details about a movie
  Given I am on the home page
  When  I follow "More about Star Wars"
  Then  I should see "Details about Star Wars"
  And   I should see "Director: George Lucas"

Scenario: remove a movie I no longer have
  Given I am on the home page
  When  I follow "More about Star Wars"
  And   I press "Delete"
  Then  I should see "Movie 'Star Wars' deleted."
  And   I should not see "More about Star Wars" 