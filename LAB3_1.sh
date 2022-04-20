#Z pliku yolo.csv wypisz wszystkich, których id jest liczbą nieparzystą. Wyniki zapisz na standardowe wyjście błędów.
cat yolo.csv | grep -E "^\b([0-9]?){2}[13579]," 1>&2

#Z pliku yolo.csv wypisz każdego, kto jest wart dokładnie $2.99 lub $5.99 lub $9.99. Nie wazne czy milionów, czy miliardów 
#(tylko nazwisko i wartość). Wyniki zapisz na standardowe wyjście błędów
cat yolo.csv | cut -d"," -f3,7 | grep -E "[$](2|5|9)\.99.$" 1>&2

#Z pliku yolo.csv wypisz każdy numer IP, który w pierwszym i drugim oktecie ma po jednej cyfrze. 
#Wyniki zapisz na standardowe wyjście błędów
cat yolo.csv | cut -d"," -f6 | grep -E "^\b([0-9]{1}\.){2}\.*" 1>&2