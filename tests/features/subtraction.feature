Feature: Subtraction
    The calculator can subtract numbers

    Scenario Outline: Subtracting two numbers
        Given a running calculator

        When I enter the number <first_operand> and press enter
        And I enter the number <second_operand> and press enter
        And I enter the operator - and press enter
        And I press enter

        Then the output "Das Ergebnis ist <expected_result>" is displayed

        Examples:
            | first_operand | second_operand | expected_result |
            |             0 |              0 |               0 |
            |             1 |              0 |               1 |
            |             0 |              2 |              -2 |
            |             1 |              2 |              -1 |
            |             5 |              3 |               2 |
            |     246245637 |        1783641 |       244461996 |

    Scenario: Subtracting three numbers from left to right
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the operator - and press enter
        And I enter the number 2 and press enter
        And I enter the operator - and press enter
        And I press enter

        Then the output "Das Ergebnis ist 3" is displayed

    Scenario: Subtracting three numbers from right to left
        Given a running calculator

        When I enter the number 10 and press enter
        And I enter the number 5 and press enter
        And I enter the number 2 and press enter
        And I enter the operator - and press enter
        And I enter the operator - and press enter
        And I press enter

        Then the output "Das Ergebnis ist 7" is displayed
