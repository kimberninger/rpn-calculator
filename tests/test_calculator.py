import runpy
from unittest.mock import patch

from pytest import fixture
from pytest_bdd import given, parsers, scenarios, then, when


scenarios("features/addition.feature")
scenarios("features/subtraction.feature")
scenarios("features/multiplication.feature")
scenarios("features/division.feature")


@fixture(name="commands")
def get_commands() -> list[str]:
    return []


@given("a running calculator")
def start_calculator(capsys):
    pass


@when(parsers.parse("I enter the number {number:d} and press enter"))
def enter_number(commands: list[str], number: int):
    commands.append(f"{number}\n")


@when(parsers.parse("I enter the operator {operator} and press enter"))
def enter_operator(commands: list[str], operator: str):
    commands.append(f"{operator}\n")


@when("I press enter")
def press_enter(commands: list[str]):
    commands.append("\n")


@then(parsers.parse('the output "{expected_output}" is displayed'))
def check_output(capsys, commands: list[str], expected_output: str):
    with patch("builtins.input") as mock_input:
        mock_input.side_effect = commands
        runpy.run_module("calculator.main")
    assert capsys.readouterr().out.rstrip() == expected_output
