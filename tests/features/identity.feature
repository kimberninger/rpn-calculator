Feature: Identity
    The calculator can output numbers

    Scenario Outline: Outputting a number
        Given a running calculator

        When I enter the number <number> and press enter
        And I press enter

        Then the output "Das Ergebnis ist <expected_result>" is displayed

        Examples:
            |  number | expected_result |
            |       0 |               0 |
            |       1 |               1 |
            |       2 |               2 |
            |       3 |               3 |
            |       4 |               4 |
            | 4254801 |         4254801 |
