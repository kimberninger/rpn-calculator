# Taschenrechner für umgekehrte polnische Notation
# ================================================
#
# Ziel dieser Übung ist die Implementierung eines kommandozeilen-basierten interaktiven
# Taschenrechners.
#
# Zur Eingabe der Terme soll die umgekehrte polnische Notation verwendet werden:
# https://de.wikipedia.org/wiki/Umgekehrte_polnische_Notation.
# Hier wird der Operator nicht zwischen die Operanden geschrieben, sondern dahinter. Statt "3 + 4"
# würde man also "3 4 +" schreiben. Und "9 + (8 - 5)" würde man in der umgekehrten polnischen
# Notation durch "9 8 5 - +" darstellen. Ein letztes Beispiel noch: statt "(4 + 5) / (6 - 3)" würde
# man "4 5 + 6 3 - /" schreiben.
#
# Insgesamt ermöglicht dies eine eindeutige Auswertung von Termen ohne die Notwendigkeit von
# Klammern. Außerdem werden auch Operatoren mit mehr oder weniger als zwei Operanden möglich.
#
# Erstelle in dieser Aufgabe ein Programm, das solche Ausdrücke auswerten kann, nachdem es den Term
# Stück für Stück über die Kommandozeile abgefragt hat. Wird die Interaktion mit dem Programm durch
# eine leere Eingabe beendet, soll das Ergebnis zuvor noch auf der Kommandozeile ausgegeben werden.
#
# Eine mögliche Interaktion mit dem Programm sollte wie folgt aussehen:
#
#     > % python main.py
#     > Zahl eingeben: 4
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): 5
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): +
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): 6
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): 3
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): -
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): /
#     > Zahl oder Operation eingeben (oder Enter zum Auswerten drücken):
#     > Das Ergebnis ist 3.0
#
# Der Taschenrechner sollte grundsätzlich mit natürlichen Zahlen und den Grundrechenarten "+", "-",
# "*" und "/" umgehen können.
#
# Ideen für Erweiterungen:
#  - lass den Taschenrechner auch negative Zahlen wie "-2" oder Dezimalzahlen wie "14.1" korrekt
#    verarbeiten,
#  - erweitere den Taschenrechner um den Operator "sqrt", der nur einen Operanden erwartet und als
#    Ergebnis dessen Wurzel liefert: "3 1 + sqrt" sollte demnach "2" als Ergebnis haben,
#  - füge den Operator "sum" hinzu, dessen Ergebnis die Summe aller vorherigen Operanden ist:
#    "1 2 3 4 3 - sum 100 +" sollte also den Wert "107" haben, oder
#  - implementiere eine umfängliche Fehlerbehandlung, die bei falsch formatierten Eingaben
#    entsprechende Hinweise auf der Kommandozeile ausgibt, was schiefgelaufen ist.
#
# Tipp: mit der Methode "isdigit()" lässt sich herausfinden, ob es sich beim Inhalt eines Strings um
#       eine natürliche Zahl handelt, der mit "int(...)" in eine solche umgewandelt werden kann.
#       Ist also
#           n = "34"
#       dann liefert
#           n.isdigit()
#       den Wert "True".
#
# Viel Erfolg! :)

import math

stack = []
input_string = input("Zahl eingeben: ").strip()

while input_string:
    if input_string.isdigit():
        stack.append(int(input_string))
    elif input_string == "+":
        second_operand = stack.pop()
        first_operand = stack.pop()
        stack.append(first_operand + second_operand)
    elif input_string == "-":
        second_operand = stack.pop()
        first_operand = stack.pop()
        stack.append(first_operand - second_operand)
    elif input_string == "*":
        second_operand = stack.pop()
        first_operand = stack.pop()
        stack.append(first_operand * second_operand)
    elif input_string == "/":
        second_operand = stack.pop()
        first_operand = stack.pop()
        stack.append(first_operand / second_operand)
    elif input_string == "sum":
        result = 0
        for number in stack:
            result += number
        stack = [result]
    elif input_string == "sqrt":
        operand = stack.pop()
        stack.append(math.sqrt(operand))
    else:
        print("Unbekanntes Eingabeformat:", input_string)

    input_string = input(
        "Zahl oder Operation eingeben (oder Enter zum Auswerten drücken): "
    ).strip()

print("Das Ergebnis ist", stack.pop())
