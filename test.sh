#!/bin/bash

echo -n "Hello World"
echo -n "Hello World"

echo "Hello World"
echo "Hello World"
echo -e "\n -------------------------\n"

# Pokud chci vypsat např. cestu, hodí se příznak -E, který zakáže interpretaci zpětných lomítek
echo -E "C:\\Users\David\nová složka\test.txt"
echo -e "\n -------------------------\n"

# první echo vypíše heslo do konzole
echo  -n "ahoj moje heslo je: topsecretPassword"
# script se uspí na 1s.
sleep 1
# původní text se přepíše novým. \r vrací na začátek řádku
echo -e "\rtady rozhodně nebylo žádné heslo :-)"
echo -e "\n -------------------------\n"

name="David Šec"
age=33
# Vypíše jméno a věk do konzole.
echo "Ahoj jmenuji se $name a je mi $age let."
echo -e "\n -------------------------\n"

# Výpis vybraných systémových proměnných
echo "Uživatel: $USER"
echo "Domovský adresář: $HOME"
echo "Aktuální složka: $PWD"
echo "Náhodné číslo: $RANDOM"
echo "Název skriptu: $0"
echo -e "\n -------------------------\n"


# Vypíše pozdrav do konzole. Proměnná greetingsFrom je předaná jako argument scriptu.
# script se násedně volá ./lesson1.sh Honzy "je u lékaře"
# !! argumenty obsahující mezery musí být v uvozovkách
greetingsFrom=$1
reasonOfAbsence=$2
echo "Srdečný pozdrav od $greetingsFrom, který dnes chybí protože $reasonOfAbsence :-)"
echo -e "\n -------------------------\n"

# čtení uživatelského vstupu pomocí příkazu read. read název_proměnné,
# případně read argumenty název_proměnné

read nameFromUser
echo "Ahoj $nameFromUser děkuji za odpověď."
echo -e "\n -------------------------\n"

# Podmínky v BASH
if [[ 10 -eq 9 ]]; then
    echo "pravda"
else
    echo "nepravda"
fi








