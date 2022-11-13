Feature: Addition
    The calculator can add numbers

    Scenario Outline: Adding two numbers
        Given a running calculator

        When I enter the number <first_operand> and press enter
        And I enter the number <second_operand> and press enter
        And I enter the operator + and press enter
        And I press enter

        Then the output "Das Ergebnis ist <expected_result>" is displayed

        Examples:
            | first_operand | second_operand | expected_result |
            |             0 |              0 |               0 |
            |             1 |              0 |               1 |
            |             0 |              2 |               2 |
            |             1 |              2 |               3 |
            |             3 |              4 |               7 |
            |       4254801 |        5829341 |        10084142 |

    Scenario: Adding three numbers from left to right
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the operator + and press enter
        And I enter the number 2 and press enter
        And I enter the operator + and press enter
        And I press enter

        Then the output "Das Ergebnis ist 17" is displayed

    Scenario: Adding three numbers from right to left
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the number 2 and press enter
        And I enter the operator + and press enter
        And I enter the operator + and press enter
        And I press enter

        Then the output "Das Ergebnis ist 17" is displayed
