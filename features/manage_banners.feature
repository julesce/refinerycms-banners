@banners
Feature: Banners
  In order to have banners on my website
  As an administrator
  I want to manage banners

  Background:
    Given I am a logged in refinery user
    And I have no banners

  @banners-list @list
  Scenario: Banners List
   Given I have banners titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of banners
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @banners-valid @valid
  Scenario: Create Valid Banner
    When I go to the list of banners
    And I follow "Add New Banner"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 banner

  @banners-invalid @invalid
  Scenario: Create Invalid Banner (without name)
    When I go to the list of banners
    And I follow "Add New Banner"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 banners

  @banners-edit @edit
  Scenario: Edit Existing Banner
    Given I have banners titled "A name"
    When I go to the list of banners
    And I follow "Edit this banner" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of banners
    And I should not see "A name"

  @banners-duplicate @duplicate
  Scenario: Create Duplicate Banner
    Given I only have banners titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of banners
    And I follow "Add New Banner"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 banners

  @banners-delete @delete
  Scenario: Delete Banner
    Given I only have banners titled UniqueTitleOne
    When I go to the list of banners
    And I follow "Remove this banner forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 banners
 