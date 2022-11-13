Feature: Mixed Terms
    The calculator can handle terms with mixed operations

    Scenario: Evaluating a term with addition, subtraction, multiplication and division
        Given a running calculator

        When I enter the number 4 and press enter
        And I enter the number 5 and press enter
        And I enter the operator + and press enter
        And I enter the number 3 and press enter
        And I enter the number 2 and press enter
        And I enter the operator * and press enter
        And I enter the number 3 and press enter
        And I enter the operator - and press enter
        And I enter the operator / and press enter
        And I press enter

        Then the output "Das Ergebnis ist 3.0" is displayed
