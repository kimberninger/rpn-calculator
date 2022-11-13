Feature: Division
    The calculator can divide numbers

    Scenario Outline: Dividing two numbers
        Given a running calculator

        When I enter the number <first_operand> and press enter
        And I enter the number <second_operand> and press enter
        And I enter the operator / and press enter
        And I press enter

        Then the output "Das Ergebnis ist <expected_result>" is displayed

        Examples:
            | first_operand | second_operand | expected_result |
            |             0 |              1 |             0.0 |
            |             1 |              1 |             1.0 |
            |             0 |              2 |             0.0 |
            |             3 |              2 |             1.5 |
            |            10 |             10 |             1.0 |
            |         39852 |            123 |           324.0 |

    Scenario: Dividing three numbers from left to right
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the operator / and press enter
        And I enter the number 2 and press enter
        And I enter the operator / and press enter
        And I press enter

        Then the output "Das Ergebnis ist 1.0" is displayed

    Scenario: Dividing three numbers from right to left
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the number 2 and press enter
        And I enter the operator / and press enter
        And I enter the operator / and press enter
        And I press enter

        Then the output "Das Ergebnis ist 4.0" is displayed
