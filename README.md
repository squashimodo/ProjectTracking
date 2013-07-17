# Projekt Tracking

Ett enklare projekthanteringssystem utvecklat i Ruby On Rails i samband med kursen "Webbramverk" på Linneuniversitetet.

## Applikationen
### Övergripande krav
- Minst tre olika dataobjekt/tabeller som samverkar i applikationen.
- Minst en många till många-relation mellan två av dessa objekt.
- Applikationen ska ha en säker inloggningsfunktion med minst två olika användarroller (ej krav på SSL).
- Applikationen ska ha någon form av söknings- eller filtreringsfunktion.
- Designen ska vara genomarbetad och interaktionen med applikationen ska vara enkel att förstå.
- Webbapplikationen ska naturligtvis vara buggfri och vara skriven med Ruby on Rails.

### Övrigt
Webbapplikationen är tänkt att kunna användas av en grupp människor som har en mängd olika projekt ihop. Man vill kunna hålla koll på projekten och de olika delmålen (tickets) som varje projekt innehåller.

Applikationen ska kunna hantera flera projekt.

Varje projekt kan ha flera användare knutna till sig. Varje projekt ska kunna ges ett namn, en beskrivning, ett start- och ett planerat slutdatum.

Varje projekt kan ha flera tickets (delmål) som i sin tur kan ha ett antal olika ”status” (t.ex. new feature, to-do bug, won’t fix, closed), en ansvarig användare för ticket:n och naturligtvis en beskrivning. En ticket ska också den kunna ha en start- och en planerad sluttid på lämpligt datumformat.

Applikationen ska kunna hantera användare av rollerna ”User” och Admin”. Följande gäller för dessa roller.

En ”User” ska kunna medverka i flera olika projekt och kunna se, skapa, ändra, ta bort tickets till dessa. En ”User” ska bara kunna se de projekt han/hon är medlem i.

”Admin” kan skapa, redigera och ta bort befintliga projekt.

Användare (inklusive användaruppgifter) kan få skapas manuellt via t.ex. rails console och behöver alltså inte ha någon del i webbapplikationen. Detta gäller också kopplingen mellan ”Users” och projekten.

#### Applikationen har även följande krav på sig
- Lättförstålig att använda
- Kunna logga in i systemet på startsidan
- Kunna logga ut när man är inloggad
- ”User” ska ha en personlig sida där man får en överskådlig bild av projekten man är med i och därifrån kan gå vidare i applikationen för mer information om valt projekt.
- De enskilda projektens sida ska ha en översiktlig vy där man kan se användare, tickets o.s.v.
- Du ska enkelt kunna filtrera olika tickets i ett projekt beroende på status
- Som default ska varje ticket vara sorterad på fallande slutdatum.
