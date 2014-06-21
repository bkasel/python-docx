Feature: Access and change section properties
  In order to discover and modify document section behaviors
  As a developer using python-docx
  I need a way to get and set the properties of a section


  Scenario Outline: Get section start type
    Given a section having start type <start-type>
     Then the reported section start type is <start-type>

    Examples: Section start types
      | start-type |
      | CONTINUOUS |
      | NEW_COLUMN |
      | NEW_PAGE   |
      | EVEN_PAGE  |
      | ODD_PAGE   |


  Scenario Outline: Set section start type
    Given a section having start type <initial-start-type>
     When I set the section start type to <new-start-type>
     Then the reported section start type is <reported-start-type>

    Examples: Section start types
      | initial-start-type | new-start-type | reported-start-type |
      | CONTINUOUS         | NEW_PAGE       | NEW_PAGE            |
      | NEW_PAGE           | ODD_PAGE       | ODD_PAGE            |
      | NEW_COLUMN         | None           | NEW_PAGE            |


  Scenario: Get section page size
    Given a section having known page dimension
     Then the reported page width is 8.5 inches
      And the reported page height is 11 inches


  Scenario: Set section page size
    Given a section having known page dimension
     When I set the section page width to 11 inches
      And I set the section page height to 8.5 inches
     Then the reported page width is 11 inches
      And the reported page height is 8.5 inches


  Scenario Outline: Get section orientation
    Given a section known to have <orientation> orientation
     Then the reported page orientation is <reported-orientation>

    Examples: Section page orientations
      | orientation | reported-orientation |
      | landscape   | WD_ORIENT.LANDSCAPE  |
      | portrait    | WD_ORIENT.PORTRAIT   |


  Scenario Outline: Set section orientation
    Given a section known to have <initial-orientation> orientation
     When I set the section orientation to <new-orientation>
     Then the reported page orientation is <reported-orientation>

    Examples: Section page orientations
      | initial-orientation | new-orientation      |  reported-orientation |
      | portrait            | WD_ORIENT.LANDSCAPE  |  WD_ORIENT.LANDSCAPE  |
      | landscape           | WD_ORIENT.PORTRAIT   |  WD_ORIENT.PORTRAIT   |
      | landscape           | None                 |  WD_ORIENT.PORTRAIT   |
