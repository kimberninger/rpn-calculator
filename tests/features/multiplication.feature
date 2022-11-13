Feature: Multiplication
    The calculator can multiply numbers

    Scenario Outline: Multiplying two numbers
        Given a running calculator

        When I enter the number <first_operand> and press enter
        And I enter the number <second_operand> and press enter
        And I enter the operator * and press enter
        And I press enter

        Then the output "Das Ergebnis ist <expected_result>" is displayed

        Examples:
            | first_operand | second_operand | expected_result |
            |             0 |              0 |               0 |
            |             1 |              0 |               0 |
            |             0 |              2 |               0 |
            |             1 |              2 |               2 |
            |             3 |              4 |              12 |
            |           342 |          12345 |         4221990 |

    Scenario: Multiplying three numbers from left to right
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the operator * and press enter
        And I enter the number 2 and press enter
        And I enter the operator * and press enter
        And I press enter

        Then the output "Das Ergebnis ist 100" is displayed

    Scenario: Multiplying three numbers from right to left
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the number 2 and press enter
        And I enter the operator * and press enter
        And I enter the operator * and press enter
        And I press enter

        Then the output "Das Ergebnis ist 100" is displayed
