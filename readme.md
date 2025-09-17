# Záladní příkazy Echo, Read, proměnné, if
 
 ## Why you need to learn BASH Scripting RIGHT NOW!! // EP 1 YTB:
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/SPwyp2NG-bE/0.jpg)](https://www.youtube.com/watch?v=SPwyp2NG-bE)

# Příkaz `echo`
`echo` slouží k výpisu textu nebo hodnot proměnných na obrazovku (standardní výstup). Je to nejjednodušší způsob, jak komunikovat s uživatelem nebo ladit skript.
### Syntaxe
```bash
echo [volby] text
```
text – může být libovolný text nebo proměnná.

[volby] – volitelné parametry, které ovlivňují chování výstupu. například -n 
### Hlavní volby `echo`

| Volba | Popis | Příklad |
|-------|-------|---------|
| `-n`  | Neukončuje výstup novým řádkem. | `echo -n "Zadej jméno: "` |
| `-E`  | Zakáže interpretaci zpětných lomítek (výchozí). | `echo -E "Cesta: C:\Users\Jan"` |

### Speciální znaky s `-e`

| Znak | Význam | Příklad |
|------|--------|---------|
| `\n` | Nový řádek | `echo "První řádek\nDruhý řádek"` |
| `\t` | Tabulátor | `echo "Slovo1\tSlovo2"` |
| `\\` | Zpětné lomítko | `echo "Cesta: C:\\Users\\Jan"` |
| `\a` | Zvukový signál (beep) | `echo "\a"` |
| `\r` | Carriage return (návrat na začátek řádku) | `echo "12345\rABCDE"` |


```bash 
echo -n "Hello World"
echo -n "Hello World"

echo "Hello World"
echo "Hello World"
```

# Proměnné v Bash
Proměnná je jméno, které uchovává hodnotu, například číslo, text nebo cestu k souboru.
V Bash nemusíš proměnnou deklarovat explicitně – stačí jí přiřadit hodnotu.

### Základní syntaxe
```bash
nazev_promenne=hodnota
```

> [!POZOR]
> Pozor: mezi = a hodnotou nesmí být mezera!

Hodnotu lze později použít pomocí $nazev_promenne.

```bash
#!/bin/bash
name="David"
age=33

echo "Jmenuji se $name a je mi $age let."
```

## Systémové proměnné
V Bash existuje spousta **předdefinovaných systémových proměnných**, které poskytují informace o prostředí, uživateli, skriptu nebo posledních příkazech. Tady je přehled vybraných nejčastěji používaných:

# Vybrané často používané systémové proměnné 
| Proměnná | Význam | Příklad |
|----------|--------|---------|
| `$HOME`  | Domovský adresář uživatele | `echo $HOME` → `/home/uzivatel` |
| `$USER`  | Uživatelské jméno | `echo $USER` → `jan` |
| `$PWD`   | Aktuální pracovní adresář | `echo $PWD` → `/home/uzivatel` |
| `$OLDPWD`| Předchozí pracovní adresář | `cd ..; echo $OLDPWD` |
| `$SHELL` | Cesta k aktuálnímu shellu | `echo $SHELL` → `/bin/bash` |
| `$PATH`  | Seznam adresářů pro hledání příkazů | `echo $PATH` → `/usr/local/bin:/usr/bin:...` |
| `$?`     | Návratový kód posledního příkazu | `ls; echo $?` → `0` (úspěch) |
| `$$`     | PID aktuálního skriptu | `echo $$` → `12345` |
| `$0`     | Název aktuálního skriptu | `echo $0` → `./script.sh` |
| `$#`     | Počet parametrů předaných skriptu | `echo $#` → `2` (pokud byly 2 argumenty) |
| `$@`     | Seznam všech argumentů | `echo $@` → `arg1 arg2 arg3` |
| `$*`     | Stejné jako `$@`, ale celý řetězec jako jeden | `echo $*` → `arg1 arg2 arg3` |
| `$1, $2, ...` | Jednotlivé argumenty skriptu | `echo $1` → první argument |
| `$!`     | PID posledního spuštěného procesu na pozadí | `sleep 10 &; echo $!` |
| `$RANDOM`| Náhodné číslo (0–32767) | `echo $RANDOM` |
| `$LINENO`| Číslo aktuálního řádku skriptu | `echo $LINENO` |
| `$IFS`   | Internal Field Separator (výchozí oddělovač: mezera, tab, newline) | `echo "$IFS"` |

### Ukázaka výpisu systémových proměnných

```bash
#!/bin/bash
echo "Uživatel: $USER"
echo "Domovský adresář: $HOME"
echo "Aktuální složka: $PWD"
echo "Náhodné číslo: $RANDOM"
echo "Název skriptu: $0"
```
## Předávání proměnných (argumentů) při spouštění scriptu
Bash můžeš proměnné předávat skriptu jako parametry při jeho spuštění. To je velmi užitečné, protože pak může skript pracovat s různými vstupy bez nutnosti měnit jeho kód.


Cvičení: Vytvořte soubor `pozdrav.sh` s následujícím obsahem:
```bash
#!/bin/bash
echo "Jméno: $1 Příjmení: $2"
echo "Věk: $3"
```
a následně script spusťte pomocí : 
```bash 
bash pozdrav.sh David Sec 33
```

# Příkaz `read`
Příkaz `read` slouží k získání vstupu od uživatele z terminálu. Hodnotu, kterou uživatel zadá, uloží do proměnné.

### Syntaxe
```bash
read [volby] proměnná
```

proměnná – název proměnné, do které se uloží zadaný text.

[volby] – různé parametry (např. pro tichý vstup nebo timeout). 


| Volba | Popis | Příklad |
|-------|-------|---------|
| `-p`  | Prompt – vypíše text výzvy před čekáním na vstup | `read -p "Zadej jméno: " jmeno` |
| `-s`  | Silent – nevypisuje zadané znaky (např. heslo) | `read -s heslo` |
| `-t`  | Timeout – čeká maximálně N sekund na vstup | `read -t 5 odpoved` |
| `-n`  | Počet znaků – přečte jen N znaků a okamžitě skončí | `read -n 1 volba` |
| `-r`  | Raw – nezpracovává zpětná lomítka (`\`) | `read -r cesta` |
| `-a`  | Array – uloží vstup do pole rozděleného podle IFS | `read -a pole` |
| `-d`  | Delimiter – nastaví vlastní znak ukončení | `read -d ":" text` |

# Ukázky použití

1. **Prompt s uložením do proměnné**
```bash
read -p "Zadej jméno: " name
echo "Ahoj, $name!"
```

#  podmínky `if` `elif` `else`

## 1. Účel
`if` slouží k **kontrole podmínky** a provedení určité akce pouze tehdy, pokud je podmínka pravdivá.  
`elif` je zkratka pro “else if” a používá se v Bash pro kontrolu další podmínky, pokud předchozí if nebyla pravdivá. 
 - Pokud se vyhodnotí jako pravda (true), provede se jeho blok a zbytek podmínek se ignoruje.

`else` se používá v Bash k určení bloku příkazů, který se provede, pokud všechny předchozí podmínky (if a případně elif) nejsou pravdivé

## Základní syntaxe
```bash
if [[ podmínka1 ]]; then
  příkazy
elif [[ podmínka2 ]]; then
  příkazy
else
  příkazy
fi
```
