--*********************************************************  TWORZENIE TABEL  *********************************************************-- 

--### TABELA ZAWODNICY ###--


CREATE TABLE ZAWODNICY (
id_zawodnika NUMBER(3) constraint zawodnicy_pk PRIMARY KEY,
imie VARCHAR2(30) constraint zawodnicy_imie_nn NOT NULL,
nazwisko VARCHAR2(30) constraint zawodnicy_nazwisko_nn NOT NULL,
data_ur date constraint zawodnicy_data_nn NOT NULL, 
narodowosc VARCHAR2(30) constraint zawodnicy_kraj_nn NOT NULL,

constraint zawodnicy_unique UNIQUE(imie, nazwisko, data_ur, narodowosc)
);

--### TABELA SKOCZNIE ###--


CREATE TABLE SKOCZNIE (
id_skoczni VARCHAR2(4) constraint skocznie_pk PRIMARY KEY,
nazwa VARCHAR2(40) constraint skocznie_nazwa_nn NOT NULL,
miasto VARCHAR2(30) constraint skocznie_miasto_nn NOT NULL, 
kraj VARCHAR2(30) constraint skocznie_kraj_nn NOT NULL,
punkt_k number (4,1) constraint skocznie_punktk_nn NOT NULL,
punkt_hs number(4,1) constraint skocznie_punkths_nn NOT NULL,

constraint skocznie_unique UNIQUE(nazwa, miasto, kraj)
);


--### TABELA KONKURSY ###--


CREATE TABLE KONKURSY (
id_konkursu VARCHAR2(4) constraint konkursy_pk PRIMARY KEY,
id_skoczni VARCHAR2(4) constraint konkurs_id_skoczni_nn NOT NULL,
data_konkursu date constraint konkursy_data_nn NOT NULL,
szczegoly VARCHAR2(10) constraint konkursy_szczegoly_check check(szczegoly in ('PŒ', 'WF', 'P7', 'RA', 'TCS')),
przypisy VARCHAR2(60),

constraint konkuursy_id_skoczni_fk Foreign Key(id_skoczni) References skocznie(id_skoczni)
);


--### TABELA WYNIKI ###--


CREATE TABLE WYNIKI (
id_konkursu varchar2(4) constraint wyniki_nn NOT NULL,
id_zawodnika number(3) constraint wyniki_id_zawodnika_nn NOT NULL,
I_Seria number(4,1) constraint wyniki_Iseria_nn NOT NULL,
II_Seria number(4,1),
Suma_Pkt number(4,1) constraint wyniki_suma_nn NOT NULL,
miejsce number(2) constraint wyniki_miejsce_nn NOT NULL,
uwagi varchar2(40),
podium varchar2(60) GENERATED ALWAYS AS ( case 
                                          when miejsce = 1 then '<html><font size="5" color="#D4AF37">' || 'ZWYCIEZCA'
                                          when miejsce = 2 then '<html><font size="4" color="#6C7A86">' || 'DRUGIE MIEJSCE'
                                          when miejsce = 3 then '<html><font size="3" color="#6C3C14">' || 'TRZECIE MIEJSCE'
                                          when miejsce between 4 and 10 then '<html><font color="#007630">' || 'TOP 10'
                                          when miejsce between 11 and 20 then '<html><font color="#003B76">' || 'TOP 20'
                                          when miejsce between 21 and 30 then '<html><font color="#760020">' || 'TOP 30'
                                          end) VIRTUAL,

constraint wyniki_id_zawodnika_fk Foreign Key(id_zawodnika) References zawodnicy(id_zawodnika),
constraint wyniki_id_konkursu_fk Foreign Key(id_konkursu) References konkursy(id_konkursu)

);

--*********************************************************  SEKWENCJA DO TABELI ZAWODNICY *********************************************************-- 

CREATE SEQUENCE zawodnicy_seq
minvalue 101  
maxvalue 999 
start with 101  
cycle 
increment by 1;

--*********************************************************  WPROWADZANIE DANYCH *********************************************************-- 

--###############  WSTAWIANIE DANYCH DO TABELI ZAWODNICY  ############### -- 

INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Adreas', 'Wellinger', to_date('28-08-1995', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Anders', 'Fannemel', to_date('13-05-1991', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Andreas', 'Stjernen', to_date('30-07-1988', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Andreas', 'Wank', to_date('18-02-1988', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Anze', 'Semenic', to_date('01-08-1993', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Cestmir', 'Kozisek', to_date('09-11-1991', 'DD-MM-YYYY'), 'Czechy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Clemens', 'Aigner', to_date('02-02-1993', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Constantin', 'Schmid', to_date('27-11-1999', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Daniel', 'Huber', to_date('02-01-1993', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Daniel-Andre', 'Tande', to_date('24-01-1994', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Dawid', 'Kubacki', to_date('12-03-1990', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Dienis', 'Kornilow', to_date('17-08-1986', 'DD-MM-YYYY'), 'Rosja');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Domen', 'Prevc', to_date('04-06-1999', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Gregor', 'Deschwanden', to_date('27-02-1991', 'DD-MM-YYYY'), 'Szwajcaria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Gregor', 'Schlirenzauer', to_date('07-01-1990', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Halvor Egner', 'Granerud', to_date('29-05-1996', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Jakub', 'Wolny', to_date('15-05-1995', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Jernej', 'Damjan', to_date('28-05-1983', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Johann Andre', 'Forfang', to_date('04-07-1995', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Junshiro', 'Kobayashi', to_date('11-06-1991', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Jurij', 'Tepes', to_date('14-02-1989', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Kamil', 'Stoch', to_date('25-05-1987', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Karl', 'Geiger', to_date('11-02-1993', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Kevin', 'Bickner', to_date('23-09-1996', 'DD-MM-YYYY'), 'Stany Zjednoczone');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Maciej', 'Kot', to_date('09-06-1991', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Mackenzie', 'Boyd-Clowes', to_date('13-07-1991', 'DD-MM-YYYY'), 'Kanada');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Manuel', 'Fettner', to_date('17-06-1985', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Manuel', 'Poppinger', to_date('19-05-1989', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Marius', 'Lindvik', to_date('27-06-1998', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Markus', 'Eisenbichler', to_date('03-04-1991', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Michael', 'Haybock', to_date('05-03-1991', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Nejc', 'Dezman', to_date('07-12-1992', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Noriaki', 'Kasai', to_date('06-06-1972', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Peter', 'Prevc', to_date('20-09-1992', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Philipp', 'Aschenwald', to_date('12-11-1995', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Piotr', '¯y³a', to_date('16-01-1987', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Pius', 'Paschke', to_date('20-05-1990', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Richard', 'Freitag', to_date('14-08-1991', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Robert', 'Johansson', to_date('23-03-1990', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Robert', 'Kranjec', to_date('16-07-1981', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Ryoyu', 'Kobayashi', to_date('08-11-1996', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Simon', 'Ammann', to_date('25-06-1981', 'DD-MM-YYYY'), 'Szwajcaria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Stefan', 'Hula', to_date('29-09-1985', 'DD-MM-YYYY'), 'Polska');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Stefan', 'Kraft', to_date('13-05-1993', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Stephan', 'Leyhe', to_date('05-01-1992', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Taku', 'Takeuchi', to_date('20-05-1987', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Tilen', 'Bartol', to_date('17-04-1997', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Timi', 'Zajc', to_date('26-04-2000', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Yukiya', 'Sato', to_date('19-06-1995', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Ziga', 'Jelar', to_date('22-10-1997', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Florian', 'Altenburger', to_date('02-11-1993', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'W³adimir', 'Zografski', to_date('14-07-1993', 'DD-MM-YYYY'), 'Bu³garia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Tomaž', 'Nagliè', to_date('18-07-1989', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Antti', 'Aalto', to_date('02-04-1995', 'DD-MM-YYYY'), 'Finlandia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Bor', 'Pavlovèiè', to_date('27-06-1998', 'DD-MM-YYYY'), 'S³owenia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Killian', 'Peier', to_date('28-03-1995', 'DD-MM-YYYY'), 'Szwajcaria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Roman', 'Koudelka', to_date('09-07-1989', 'DD-MM-YYYY'), 'Czechy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'William', 'Rhoads', to_date('08-06-1995', 'DD-MM-YYYY'), 'Stany Zjednoczone');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Alex', 'Insam', to_date('19-12-1997', 'DD-MM-YYYY'), 'W³ochy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'David', 'Siegel', to_date('28-08-1996', 'DD-MM-YYYY'), 'Niemcy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Sondre', 'Ringen', to_date('09-10-1996', 'DD-MM-YYYY'), 'Norwegia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Ulrich', 'Wohlgenannt', to_date('01-08-1994', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Daiki', 'It?', to_date('27-12-1985', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Jonathan', 'Learoyd', to_date('03-11-2000', 'DD-MM-YYYY'), 'Francja');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Jewgienij', 'Klimow', to_date('03-02-1994', 'DD-MM-YYYY'), 'Rosja');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Eetu', 'Nousiainen', to_date('29-04-1997', 'DD-MM-YYYY'), 'Finlandia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Vincent', 'Descombes-Sevoie', to_date('09-01-1984', 'DD-MM-YYYY'), 'Francja');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Vojtìch', 'Štursa', to_date('03-08-1995', 'DD-MM-YYYY'), 'Czechy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Clemens', 'Leitner', to_date('07-11-1998', 'DD-MM-YYYY'), 'Austria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Naoki', 'Nakamura', to_date('19-09-1996', 'DD-MM-YYYY'), 'Japonia');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Andreas', 'Schuler', to_date('30-12-1995', 'DD-MM-YYYY'), 'Szwajcaria');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Dmitrij', 'Wasiljew', to_date('26-12-1979', 'DD-MM-YYYY'), 'Rosja');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Sebastian', 'Colloredo', to_date('09-09-1987', 'DD-MM-YYYY'), 'W³ochy');
INSERT INTO ZAWODNICY(id_zawodnika, imie, nazwisko, data_ur, narodowosc) VALUES(zawodnicy_seq.nextval, 'Tomasz', 'Pilch', to_date('20-10-2000', 'DD-MM-YYYY'), 'Polska');

/* SELECT * FROM ZAWODNICY */



--###############  WSTAWIANIE DANYCH DO TABELI SKOCZNIE  ###############-- 

INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S001', 'Wis³a-Malinka', 'Wis³a', 'Polska', 120, 134);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S002', 'Rukatunturi', 'Kuusamo', 'Finlandia', 120, 142);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S003', 'Aist', 'Ni¿ny Tagil', 'Rosja', 120, 134);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S004', 'Hochfirstschanze', 'Titisee-Neustadt', 'Niemcy', 125, 142);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S005', 'Gross-Titlis-Schanze', 'Engelberg', 'Szwajcaria', 125, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S006', 'Schattenbergschanze', 'Oberstdorf', 'Niemcy', 120, 137);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S007', 'Große Olympiaschanze', 'Garmisch-Partenkirchen', 'Niemcy', 125, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S008', 'Bergisel', 'Innsbruck', 'Austria', 120, 130);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S009', 'Paul-Ausserleitner-Schanze', 'Bischofshofen', 'Austria', 125, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S010', 'Kulm', 'Bad Mitterndorf', 'Austria', 200, 235);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S011', 'Wielka Krokiew', 'Zakopane', 'Polska', 125, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S012', 'Mühlenkopfschanze', 'Willingen', 'Niemcy', 130, 145);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S013', 'Salpausselkä', 'Lahti', 'Finlandia', 116, 130);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S014', 'Holmenkollbakken', 'Oslo', 'Norwegia', 120, 134);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S015', 'Lysg?rdsbakken', 'Lillehammer', 'Norwegia', 123, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S016', 'Gran?sen', 'Trondheim', 'Norwegia', 124, 140);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S017', 'Vikersundbakken', 'Vikersund', 'Norwegia', 200, 240);
INSERT INTO SKOCZNIE(id_skoczni, nazwa, miasto, kraj, punkt_k, punkt_hs) VALUES('S018', 'Letalnica', 'Planica', 'S³owenia', 200, 240);

/* SELECT * FROM SKOCZNIE */


--###############  WSTAWIANIE DANYCH DO TABELI SKOCZNIE  ###############-- 

INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K001', 'S001', to_date('19-11-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K002', 'S002', to_date('26-11-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K003', 'S003', to_date('02-12-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K004', 'S003', to_date('03-12-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K005', 'S004', to_date('10-12-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K006', 'S005', to_date('16-12-2017', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K007', 'S005', to_date('17-12-2017', 'DD-MM-YYYY'), 'PŒ', 'brak');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K008', 'S006', to_date('30-12-2017', 'DD-MM-YYYY'), 'TCS', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K009', 'S007', to_date('01-01-2018', 'DD-MM-YYYY'), 'TCS', 'brak');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K010', 'S008', to_date('04-01-2018', 'DD-MM-YYYY'), 'TCS', 'brak');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K011', 'S009', to_date('06-01-2018', 'DD-MM-YYYY'), 'TCS', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K012', 'S010', to_date('13-01-2018', 'DD-MM-YYYY'), 'PŒ', 'loty');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K013', 'S010', to_date('14-01-2018', 'DD-MM-YYYY'), 'PŒ', 'odwolany');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K014', 'S011', to_date('28-01-2018', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K015', 'S012', to_date('03-02-2018', 'DD-MM-YYYY'), 'WF', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K016', 'S012', to_date('04-02-2018', 'DD-MM-YYYY'), 'WF', 'brak');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K017', 'S013', to_date('04-03-2018', 'DD-MM-YYYY'), 'PŒ', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K018', 'S014', to_date('11-03-2018', 'DD-MM-YYYY'), 'RA', 'brak');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K019', 'S015', to_date('13-03-2018', 'DD-MM-YYYY'), 'RA', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K020', 'S016', to_date('15-03-2018', 'DD-MM-YYYY'), 'RA', 'nocny');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K021', 'S017', to_date('18-03-2018', 'DD-MM-YYYY'), 'RA', 'loty');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K022', 'S018', to_date('23-03-2018', 'DD-MM-YYYY'), 'P7', 'loty');
INSERT INTO KONKURSY(id_konkursu, id_skoczni, data_konkursu, szczegoly, przypisy) VALUES('K023', 'S018', to_date('25-03-2018', 'DD-MM-YYYY'), 'P7', 'loty');

/* SELECT * FROM KONKURSY */



--###############   WSTAWIANIE DANYCH DO TABELI WYNIKI  ###############-- 

--### WIS£A ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 101, 119.5, 127, 245.3, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 102, 117, 122, 223.2, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 103, 122, 120, 239.5, 14 , 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 107, 117.5, 119.5, 230.6, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 109, 118, 131, 246.6, 6, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 110, 122, 128.5, 251.6, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 111, 125, 120.5, 244.8, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 116, 120.5, 118, 224.3, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 119, 118, 124.5, 234.7, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 120, 124, 126.5, 260.5, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 122, 121, 129.5, 258.2, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 123, 119, 120.5, 235.8, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 125, 122.5, 117.5, 232.3, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 127, 121, 121.5, 238, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 128, 116, 120.5, 221.7, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 130, 120, 119.5, 239.1, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 131, 113.5, 115, 214, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 134, 116, 122, 231.9, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 136, 122, 125, 245.6, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 137, 119, 125.5, 243.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 138, 126, 120, 253.1, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 139, 120.5, 123.5, 239.5, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 141, 112.5, 120.5, 222.9, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 143, 124, 124, 245.6, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 144, 126.5, 124.5, 257.7, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 145, 123, 121.5, 244.8, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 147, 119.5, 123, 231.6, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 160, 114.5, 123.5, 225.1, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 154, 119, 115.5, 220.5, 28, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K001', 163, 119, 126, 219.5, 29, 'brak');


--### KUUSAMO ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 101, 140, 140, 293, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 105, 128.5, 135.5, 261.3, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 107, 125, 131.5, 246, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 110, 138.5, 138.5, 292.7, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 111, 138, 135, 282, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 112, 127, 134, 254.3, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 116, 128.5, 135, 257.7, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 117, 124, 114, 208.1, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 118, 140, 142, 301.4, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 119, 136.5, 142, 298.6, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 120, 137, 134.5, 280.7, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 122, 126, 138, 258.1, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 123, 134.5, 126.5, 260.8, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 125, 126.5, 135, 265.2, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 127, 134.5, 138.5, 279, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 128, 134, 118, 242.6, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 130, 133.5, 139.5, 284.3, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 131, 127.5, 133.5, 251.9, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 134, 125.5, 136, 257.6, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 136, 138, 134, 279.4, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 137, 134.5, 132, 269.5, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 138, 134.5, 138.5, 284, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 139, 138.5, 135.5, 283.1, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 142, 132, 130, 258.3, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 143, 127, 137.5, 257.9, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 144, 126, 145, 276.7, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 145, 136.5, 135.5, 281.1, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 146, 130, 13, 267.7, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 147, 132.5, 104.5, 208.6, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K002', 154, 131.5, 125, 246.3, 26, 'brak' );


--### NIZNY-TAGIL  1 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 101, 127, 138.5, 264.2, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 102, 127, 131, 236.2, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 103, 123, 128.5, 235.9, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 105, 130, 131, 243.9, 9, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 107, 126, 127, 233.7, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 109, 127, 118, 216, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 110, 141, 134, 266.9, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 111, 126, 130.5, 242.7, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 112, 125, 127, 230.6, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 114, 137, 128.5, 250.3, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 117, 126, 117, 211.7, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 118, 127.5, 127.5, 238.2, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 119, 129, 141.5, 264.3, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 122, 128, 124, 241.2, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 123, 131, 131, 259.8, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 125, 127.5, 123.5, 237, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 127, 129.5, 127.5, 244.5, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 130, 129, 127, 241.8, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 131, 131, 122.5, 238, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 134, 131.5, 123.5, 242.5, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 136, 128, 129.5, 243.8, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 137, 130, 122.5, 239, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 138, 135, 137, 267.5, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 139, 127, 123, 230.1, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 142, 127, 124.5, 239.4, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 143, 129.5, 120, 226.1, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 144, 133, 133.5, 264.2, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 148, 119.5, 134, 242.6, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 158, 126, 131.5, 236.3, 21, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K003', 168, 124, 123.5, 221.3, 28, 'brak');


--### NIZNY-TAGIL  2 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 101, 132, 133.5, 275.7, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 102, 130, 132, 251, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 103, 127, 128, 241.8, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 105, 120.5, 126, 225.3, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 107, 119.5, 122.5, 225.5, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 110, 122, 138.5, 255.5, 5, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 111, 121.5, 126.5, 227, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 114, 116.5, 122, 210.8, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 116, 118, 126, 227.6, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 117, 124.5, 121.5, 214.5, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 118, 123, 130, 245.5, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 119, 122.5, 129.5, 240.8, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 122, 123.5, 134, 250.8, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 123, 126.5, 131.5, 250, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 125, 130, 132.5, 250.5, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 127, 124.5, 131, 242.7, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 128, 119.5, 125, 218.3, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 130, 134.5, 130, 263.2, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 136, 121.5, 131, 240.6, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 137, 120.5, 123.5, 217.6, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 138, 131, 138, 270.9, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 139, 120, 137, 243.8, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 142, 123.5, 133.5, 242.8, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 144, 128., 133.5, 263.5, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 145, 119.5, 132, 237.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 147, 119.5, 121, 214.6, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 148, 119.5, 121, 218.4, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 167, 123.5, 117, 212.8, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 158, 127, 111, 203.8, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K004', 172, 123.5, 103, 184.6, 30, 'brak');



--### TITISEE-NEUSTADT ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 101, 139.5, 0, 126, 2, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 103, 114, 0, 83.9, 29, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 105, 124.5, 0, 102.1, 18, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 108, 133, 0, 113, 8, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 109, 112.5, 0, 86.4, 28, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 110, 135.5, 0, 122.5, 3, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 111, 127.5, 0, 109.9, 11, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 112, 123, 0, 98.7, 21, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 114, 125.5, 0, 89.4, 27, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 115, 118, 0, 97.4, 22, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 117, 109.5, 0, 83.3, 30, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 118, 129.5, 0, 112.8, 9, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 119, 130, 0, 113.5, 7, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 120, 137.5, 0, 120.9, 4, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 122, 130.5, 0, 114.5, 6, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 123, 119.5, 0, 106, 14, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 127, 127, 0, 103.2, 17, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 130, 126.5, 0, 99, 20, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 133, 130, 0, 112.6, 10, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 134, 129, 0, 104.4, 15, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 136, 128, 0, 101.6, 19, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 137, 115, 0, 92.9, 24, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 138, 145, 0, 128.4, 1, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 139, 130.5, 0, 114.5, 5, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 142, 111.5, 0, 89.8, 26, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 143, 124, 0, 107.1, 13, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 144, 126, 0, 108.6, 12, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 145, 121.5, 0, 103.6, 16, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 146, 111.5, 0, 94.4, 23, 'seria II odwolana');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K005', 166, 119, 0, 92.7, 25, 'seria II odwolana' );


--### ENGELBERG  1 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 101, 121.5, 133.5, 242.2, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 102, 133, 127.5, 253.6, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 103, 133, 124, 221.4, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 105, 122, 117, 210.1, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 107, 128, 121.5, 220.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 109, 127, 125, 223.8, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 110, 123.5, 129.5, 245.4, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 111, 128, 127.5, 241.5, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 112, 124, 113.5, 203.7, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 113, 123.5, 113.5, 203.9, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 116, 132, 125.5, 243.3, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 120, 128, 124, 241.7, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 122, 125.5, 129, 250.8, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 123, 127.5, 125.5, 235.9, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 125, 124, 126, 230.8, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 127, 120.5, 120.5, 217.6, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 130, 126.5, 125, 235.8, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 131, 129.5, 121.5, 231.1, 15, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 134, 127, 124, 230.9, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 136, 127, 123.5, 239, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 137, 119.5, 117.5, 205.9, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 138, 124.5, 129.5, 253.5, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 139, 128.5, 123, 240.2, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 142, 129, 120, 233.7, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 143, 120.5, 120.5, 217.6, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 144, 119, 130, 235.1, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 145, 118, 118, 211.5, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 146, 126, 121.5, 220.2, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 148, 128.5, 117, 214.7, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K006', 156, 117.5, 117.5, 205.8, 28, 'brak' );


--### ENGELBERG  2 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 101, 134, 134, 269.8, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 102, 128.5, 131, 252, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 103, 133, 132.5, 264.9, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 109, 124, 115.5, 214, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 110, 129, 137, 261.5, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 111, 129, 126.5, 244.1, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 113, 126.5, 121, 225.7, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 116, 131, 127.5, 248.5, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 117, 130, 121, 231.9, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 118, 125, 124.5, 234.2, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 119, 133.5, 133.5, 272.3, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 120, 137.5, 128.5, 265.4, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 122, 137, 133, 274.8, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 123, 131.5, 132, 258.1, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 125, 133.5, 126, 252.8, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 127, 126.5, 123, 230.8, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 128, 127.5, 122.5, 231.5, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 130, 133.5, 132, 270.9, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 131, 127, 120, 227.3, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 134, 134, 127.5, 255, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 136, 134, 133, 265.6, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 138, 137.5, 135, 286.4, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 139, 131, 128.5, 254, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 142, 131, 134.5, 260.2, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 143, 134, 128.5, 258, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 144, 137, 134.5, 274.7, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 145, 129, 129, 248.8, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 146, 126.5, 125.5, 234.1, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 147, 125, 125.5, 234.3, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K007', 154, 126.5, 112.5, 209.7, 30, 'brak' );


--### OBERSTDORF ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 101, 115, 123, 254, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 102, 129, 124.5, 255.3, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 103, 113, 0, 110.4, 31, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 104, 109.5, 0, 103.1, 33, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 105, 98, 0, 83.5, 42, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 106, 114, 0, 104, 32, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 107, 107, 0, 99.3, 36, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 108, 114.5, 104, 220.1, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 110, 116.5, 122.5, 237.7, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 111, 126.5, 129, 270.1, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 114, 115, 119.5, 235.4, 22, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 115, 116.5, 116.5, 246, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 116, 118, 117, 235.1, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 118, 120.5, 118, 245, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 119, 114.5, 126.5, 255.3, 7, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 120, 126.5, 123, 257.1, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 122, 126, 137, 279.7, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 123, 113, 126, 241.1, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 125, 120, 126, 243.3, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 126, 112, 0, 102.8, 34, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 127, 107, 0, 94.8, 39, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 130, 128.5, 117.5, 255.1, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 131, 107.5, 124, 224, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 133, 96.5, 0, 69.4, 46, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 134, 100.5, 0, 87.6, 41, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 136, 127.5, 109.5, 231.7, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 137, 113, 0, 100, 35, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 138, 128.5, 127, 275.5, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 139, 115, 122.5, 253.4, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 141, 121.5, 118, 252.4, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 142, 120, 114.5, 240.4, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 143, 123, 120.5, 259.2, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 144, 132, 119, 262.8, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 145, 109.5, 125, 233.2, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 146, 123.5, 117, 236.5, 21, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 147, 116.6, 123.5, 241.7, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 148, 115.5, 125, 224.8, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 150, 123, 115, 240.1, 19, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 164, 125.5, 105.5, 211.7, 29, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K008', 157, 120.5, 105.5, 209.6, 30, 'lucky looser');


--### GARMISCH-PARTENKIRCHEN ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 101, 125.5, 138, 261.2, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 102, 132.5, 136.5, 270.2, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 103, 132, 137.5, 268.7, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 104, 125, 0, 115.8, 32, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 105, 120.5, 0, 108.8, 34, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 106, 119.5, 0, 106.8, 36, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 107, 118.5, 0, 108.1, 35, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 108, 128.5, 124, 236.3, 24, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 109, 109.5, 0, 92.6, 48, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 110, 120.5, 139, 256.4, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 111, 126.5, 133.5, 260.7, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 112, 117.5, 0, 101.3, 39, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 113, 115, 0, 99.7, 41, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 114, 121.5, 129.5, 230.2, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 115, 129.5, 127.5, 247.7, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 116, 132, 132, 255.7, 16, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 117, 127.5, 0, 113.6, 33, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 118, 126, 138, 259.3, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 119, 124, 138.5, 263.4, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 120, 137, 131.5, 269.2, 4, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 122, 135.5, 139.5, 283.4, 1, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 123, 136, 133.5, 268.2, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 125, 129, 133, 249, 18, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 126, 112.5, 0, 97.9, 43, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 127, 113, 0, 94.6, 47, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 130, 128.5, 136.5, 258.1, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 131, 125, 130, 245.3, 20, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 134, 129, 138, 266.9, 8, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 136, 122.5, 126, 233.7, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 137, 112.5, 0, 96, 45, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 138, 132, 137, 275.8, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 139, 123.5, 132, 250.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 141, 121.5, 121, 231.1, 29, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 143, 119.5, 126, 233.2, 27, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 144, 122.5, 0, 117.4, 31, 'przegrany w parze' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 145, 130.5, 137.5, 263.3, 10, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 146, 124.5, 126.5, 237.2, 23, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 147, 136, 133.5, 268.9, 5, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 148, 118.5, 134, 237.4, 22, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 150, 125.5, 124, 238.6, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 165, 119.5, 126, 233.4, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K009', 160, 126.5, 123.5, 231.5, 28, 'lucky looser');


--### INNSBRUCK ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 101, 133, 126, 253.5, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 102, 118, 119, 223.4, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 103, 125, 127, 241.1, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 106, 115, 0, 102.9, 42, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 107, 118, 0, 108, 33, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 108, 112, 117, 204.9, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 109, 113, 0, 103, 40, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 110, 129.5, 125, 255.6, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 111, 122, 116, 218.9, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 112, 116, 0, 103.1, 39, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 113, 112, 0, 99.2, 44, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 114, 114.5, 0, 105, 38, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 115, 117, 0, 106, 37, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 116, 118.5, 119.5, 215.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 117, 124.5, 119, 225.1, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 118, 127, 120, 239.9, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 119, 121.5, 116, 219.3, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 120, 123, 121.5, 239.4, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 122, 130, 128.5, 270.1, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 123, 125.5, 118, 230.6, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 125, 127, 121.5, 229.1, 13, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 127, 109, 0, 90.6, 47, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 130, 128.5, 117, 236.1, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 131, 123.5, 122.5, 234.7, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 132, 126, 111, 209.6, 25, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 133, 125, 112.5, 220.1, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 134, 119, 111.5, 212, 23, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 136, 122, 119, 228.4, 14, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 137, 99.5, 0, 81.2, 49, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 138, 130, 0, 113.8, 30, 'dyskw. w II serii');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 139, 124.5, 123, 237.3, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 141, 119, 0, 110.9, 31, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 142, 120, 0, 109.4, 32, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 143, 123.5, 122, 231.6, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 144, 118, 112.5, 210.3, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 145, 123.5, 119, 235.1, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 146, 113.5, 118, 215.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 147, 115, 0, 106.4, 36, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 148, 118.5, 122, 223., 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 150, 114, 116, 202, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 156, 120, 108.5, 201.1, 28, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K010', 169, 117.5, 108, 193.4, 29, 'brak' );


--### BISCHOFSCHOFEN ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 101, 129, 139.5, 270.5, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 102, 130, 139, 272.4, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 103, 129.5, 138.5, 267.2, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 105, 124.5, 121.5, 220.3, 25, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 106, 113.5, 0, 91.1, 39, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 107, 119, 0, 103.6, 31, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 108, 126.5, 123.5, 230.8, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 109, 102, 0, 66.6, 47, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 110, 124.5, 130, 242.6, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 111, 132, 127.5, 253.3, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 112, 115, 0, 94.6, 36, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 113, 122.5, 114, 199.8, 29, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 115, 118, 0, 102.5, 33, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 116, 119, 0, 103.4, 32, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 117, 97.5, 0, 58.7, 50, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 118, 122.5, 124.5, 229.9, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 119, 125, 128, 239.4, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 120, 126.5, 134.5, 255.4, 7, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 122, 132.5, 137, 275.6, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 123, 127, 123.5, 230.3, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 124, 120.5, 126, 220.2, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 126, 113, 0, 91.1, 39, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 127, 120.5, 124, 220.4, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 128, 121, 125, 221.4, 21, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 130, 126.5, 129, 244.5, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 131, 124.5, 130.5, 244.1, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 133, 97.5, 0, 61.2, 48, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 134, 127.5, 131.5, 253.8, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 136, 121, 125.5, 220.7, 23, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 137, 114.5, 0, 93, 38, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 139, 127, 140, 268.2, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 141, 120, 125, 221.5, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 142, 122.5, 125.5, 226.5, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 143, 123.5, 126, 233, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 144, 130.5, 135.5, 268.6, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 145, 124.5, 122.5, 222.4, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 146, 116, 0, 97.9, 35, 'przegrany w parze');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 148, 126, 118.5, 218.3, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 150, 117.5, 127, 221.4, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 156, 119.5, 123.5, 216.2, 28, 'lucky looser');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K011', 173, 114.5, 117, 192.4, 30, 'brak');



--### TAUPLITZ  1 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 101, 196, 211.5, 363.6, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 102, 188.5, 205, 356.2, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 103, 228.5, 225.5, 407.6, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 105, 211.5, 220.5, 386, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 106, 210, 211, 369.4, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 107, 215.5, 216.5, 388.3, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 110, 213, 241, 405.1, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 113, 205, 211, 372.1, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 116, 195, 184.5, 338.8, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 118, 218.5, 0, 195.7, 29, 'dyskw. w II serii');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 119, 209, 0, 187.6, 30, 'dyskw. w II serii');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 122, 194.5, 195.5, 343.5, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 124, 189.5, 196.5, 340.9, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 125, 198, 194.5, 341.9, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 128, 194, 203.5, 349.7, 19,  'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 130, 204, 217, 376.7, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 131, 204.5, 212.5, 369.8, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 133, 216, 227, 395, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 134, 219, 214, 392.4, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 136, 216, 201.5, 354.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 137, 191, 190, 327.2, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 139, 211.5, 230, 399, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 141, 195.5, 184.5, 325.7, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 142, 216.5, 223, 399.9, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 143, 201.5, 214.5, 367.3, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 144, 205.5, 223.5, 385.5, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 145, 204.5, 198, 344.7, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 146, 191, 200, 343, 22,  'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 147, 190.5, 206.5, 352.6, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K012', 152, 195, 183, 328.6, 26, 'brak');

--### TAUPLITZ  2 KONKURS ODWOLANY ###--

--### ZAKOPANE ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 101, 119, 132.5, 242, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 102, 125.5, 110, 175.5, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 105, 135, 134, 245.6, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 106, 122, 126.5, 194.5, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 107, 119.5, 120.5, 187.8, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 108, 129.5, 123.5, 212.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 111, 129.5, 138, 235.8, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 116, 128, 132.5, 233, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 119, 130.5, 135.5, 237.2, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 120, 123.5, 140, 230.3, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 123, 118.5, 126.5, 194.5, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 125, 124, 132, 223.6, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 127, 121.5, 117.5, 194, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 128, 127.5, 123, 211, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 129, 138, 127.5, 235.5, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 131, 120, 123, 204.9, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 133, 119, 121, 193.5, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 134, 134, 136, 241.2, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 136, 125, 118, 180.2, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 138, 129.5, 137, 230.9, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 139, 127.5, 133.5, 225.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 141, 124.5, 130.5, 218.5, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 142, 135.5, 131, 237.5, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 143, 138.5, 127, 240.9, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 144, 121, 137, 220.5, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 145, 129.5, 133, 224.1, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 157, 120, 121, 195.8, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 163, 119, 124, 191.9, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 156, 127, 129.5, 185.9, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K014', 174, 113, 114, 172.8, 30, 'brak');



--### WILLINGEN  1 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 101, 143.5, 141.5, 252.6, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 102, 139, 136.5, 235, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 103, 137, 131.5, 216.4, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 105, 141.5, 130.5, 223.7, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 109, 143.5, 138.5, 242.3, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 110, 148, 146.5, 261.3, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 111, 145, 149.5, 254.8, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 116, 136.5, 133.5, 220.9, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 117, 125, 135.5, 204.1, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 118, 133, 122, 197.9, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 119, 134.5, 144, 247.6, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 122, 146, 137.5, 254.5, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 123, 143, 130.5, 228.7, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 124, 129, 124.5, 197.5, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 125, 132.5, 129.5, 213.5, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 126, 135.5, 122, 183.6, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 130, 136, 139.5, 233, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 132, 138.5, 126, 213.2, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 134, 142, 127.5, 215, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 136, 139.5, 132.5, 230.2, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 138, 149.5, 141.5, 260.5, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 139, 140, 142.5, 245.7, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 143, 143.5, 140, 248.9, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 145, 140, 131, 222.8, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 147, 145, 135, 235.4, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 148, 142.5, 129, 220.9, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 149, 134.5, 114.5, 176.8, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 162, 128.5, 130, 197.4, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 154, 129.5, 120.5, 184.5, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K015', 172, 136, 114.5, 172.9, 30, 'brak');


--### WILLINGEN  2 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 101, 136, 138, 233.1, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 102, 142, 124.5, 220, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 103, 127, 127.5, 196.2, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 105, 141, 128.5, 222.2, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 109, 134.5, 125.5, 200.9, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 110, 136.5, 138.5, 240.5, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 111, 138, 133.5, 236.6, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 114, 128.5, 108, 162.7, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 116, 142.5, 119.5, 209.1, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 118, 130, 132.5, 223.1, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 119, 147.5, 145.5, 271.4, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 122, 145.5, 140.5, 269.4, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 123, 128.5, 131, 205.9, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 125, 142, 133.5, 236.2, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 126, 129.5, 128.5, 203.5, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 128, 136, 129, 206.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 130, 140, 134, 236.7, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 132, 142.5, 132.5, 235.6, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 134, 128.5, 132.5, 206.6, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 136, 142, 138.5, 245.1, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 138, 128, 118.5, 190.1, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 139, 137, 140.5, 243, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 143, 126.5, 145, 231, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 145, 138, 127.5, 214.8, 18, 'brak' );
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 147, 128.5, 139, 219.6, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 149, 139, 135, 231.7, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 151, 140.5, 130, 224.2, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 159, 137, 120.5, 200.4, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 162, 130.5, 124.5, 190.6, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K016', 170, 131.5, 121, 189.4, 29, 'brak');

--### LAHTI ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 101, 125, 123, 278.1, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 103, 124, 125.5, 282.6, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 107, 118, 121, 249.7, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 108, 121.5, 116.5, 241.2, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 110, 115.5, 126, 255.2, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 111, 124, 127.5, 283, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 115, 121, 123.5, 252.8, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 117, 117, 120, 242.2, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 118, 124, 123.5, 268.2, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 119, 123, 127, 270, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 120, 122.5, 127, 279.1, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 122, 132, 134, 314.2, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 123, 123, 128.5, 277.4, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 124, 117, 124.5, 250, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 125, 124.5, 125, 265.7, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 127, 118.5, 116, 237.8, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 130, 124.5, 129.5, 286, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 131, 123, 124.5, 267.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 136, 124.5, 122.5, 258.5, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 137, 120.5, 120, 245.7, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 138, 122, 120, 262.6, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 139, 120, 126.5, 267.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 141, 129.5, 125, 279.8, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 142, 118, 123, 248, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 143, 122.5, 123, 258.3, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 144, 124, 128.5, 285.9, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 145, 123.5, 120, 250, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 146, 118, 120.5, 247.1, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 147, 115.5, 116.5, 231.5, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K017', 165, 116, 116.5, 233.3, 29, 'brak');


--### OSLO ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 101, 130, 117, 233.2, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 103, 127, 124.5, 240.6, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 104, 121, 131.5, 236.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 107, 126, 122.5, 227.5, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 109, 124, 124.5, 225.4, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 110, 128, 132, 258.1, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 111, 127.5, 116, 222.9, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 115, 127, 125.5, 233.1, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 116, 124.5, 129, 236.3, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 117, 125, 123.5, 228, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 118, 129, 121.5, 237.4, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 119, 125.5, 134.5, 253.6, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 122, 138, 119, 253, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 123, 126.5, 122, 234.9, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 126, 123.5, 129.5, 233.2, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 129, 121, 128.5, 229.3, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 131, 133, 130.5, 255.6, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 133, 122.5, 111, 200.9, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 135, 127, 127.5, 237.1, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 136, 125.5, 125.5, 231, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 138, 126, 132, 241, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 139, 127.5, 129, 254, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 141, 126, 127, 231, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 142, 119.5, 132, 232.1, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 144, 129.5, 124.5, 256.7, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 145, 127, 129, 242.5, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 147, 132, 115, 220.2, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 149, 121, 123, 220.6, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 164, 133.5, 112.5, 223, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K018', 171, 122, 119.5, 206.8, 29, 'brak');


--### LILLEHAMMER ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 101, 135, 123.5, 253.1, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 102, 127.5, 123, 227.8, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 103, 134.5, 133.5, 272.5, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 104, 130, 123.5, 237.8, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 110, 135.5, 125, 257.7, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 111, 139, 140.5, 278.7, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 115, 128, 123, 233.2, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 116, 134, 128.5, 255.6, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 117, 132, 124, 239.6, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 119, 137, 131.5, 268, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 120, 134.5, 124, 250.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 122, 140.5, 141, 306.4, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 123, 134.5, 128.5, 256.3, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 126, 131, 121, 230.6, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 129, 129, 122.5, 226.2, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 130, 127, 132, 250.6, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 132, 128, 123, 229.5, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 133, 134, 123.5, 248.9, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 134, 134.5, 135, 263.4, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 135, 133.5, 120.5, 238.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 136, 133, 128.5, 252.8, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 138, 135, 141.5, 271.1, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 139, 137, 136.5, 273.7, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 141, 134, 124.5, 246.7, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 142, 129, 130.5, 251.3, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 143, 139.5, 129, 261.7, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 144, 135.5, 126.5, 262.2, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 145, 130.5, 122, 231, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 147, 131, 124.5, 235.6, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K019', 161, 132, 126, 238, 22, 'brak' );


--### TRONDHEIM ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 101, 131, 123.5, 216.9, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 103, 142.5, 142.5, 263.6, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 104, 131.5, 124 , 208, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 109, 129, 112, 187.9, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 110, 129.5, 134, 227.8, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 111, 135.5, 136.5, 247.1, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 112, 127.5, 109.5, 170.8, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 116, 135.5, 129, 228.2, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 117, 127.5, 114, 189.2, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 118, 133, 130.5, 222.1, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 119, 140.5, 136.5, 252.7, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 120, 133, 127.5, 223.4, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 122, 146, 141, 285.4, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 123, 135.5, 139.5, 249, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 124, 130.5, 123.5,  204.9, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 125, 135.5, 127.5, 227, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 129, 131, 124, 206.6, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 130, 136, 137.5, 234.2, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 131, 131.5, 131.5, 221.7, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 134, 135.5, 135.5, 248.7, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 136, 134.5, 132, 231.2, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 138, 134, 137.5, 254.7, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 139, 145.5, 136, 268, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 141, 135.5, 128.5, 229.3, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 142, 127, 127, 210.5, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 143, 130, 133.5, 232, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 144, 141.5, 138, 268.4, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 145, 133, 125.5, 220.6, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 148, 130.5, 119.5, 204.5, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K020', 152, 131.5, 128, 220.5, 21, 'brak');


--### VIKERSUND ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 102, 215, 200.5, 371.6, 18, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 103, 239, 235, 438.9, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 110, 231.5, 243, 436.6, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 111, 207.5, 225, 380.4, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 112, 215.5, 198, 371.2, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 113, 229, 239.5, 431.3, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 116, 212.5, 224, 396.4, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 117, 205.5, 184, 339.5, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 118, 212, 189.5, 356.6, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 119, 224, 230, 408.3, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 120, 210, 206.5, 361.0, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 122, 223, 237, 425.6, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 124, 202.5, 152, 306.1, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 127, 207, 171, 312.7, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 130, 232, 226.5, 420.8, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 131, 200, 199.5, 351.1, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 132, 201, 181, 323.6, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 133, 224.5, 216, 396.5, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 134, 201, 232.5, 385.3, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 136, 219.5, 221, 395.5, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 138, 219.5, 226, 414.6, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 139, 232, 246, 444.3, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 141, 203.5, 202, 362.6, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 142, 197, 211.5, 364.1, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 143, 210, 218, 379.4, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 144, 221.5, 230.5, 426.5, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 145, 209, 224, 381.2, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 147, 225.5, 202, 391.5, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K021', 149, 200, 220, 365.8, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES( 'K021', 159, 201.5, 205, 349.3, 26, 'brak' );


--### PLANICA   1 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 102, 230.5, 233, 433.1, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 103, 228.5, 221.5, 422.5, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 104, 210, 213.5, 387.4, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 105, 226, 0, 208.4, 30, 'dyskw. w II serii');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 109, 208.5, 214, 383.1, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 111, 224.5, 220, 416.8, 9, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 112, 211.5, 222.5, 389.8, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 115, 210.5, 194, 373.3, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 116, 215, 191, 364.3, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 117, 211.5, 194.5, 347, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 119, 242, 234.5, 452.2, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 120, 230.5, 224, 426.2, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 121, 225, 221, 411.1, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 122, 245, 234, 455.9, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 124, 213, 230.5, 400.9, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 130, 218.5, 224, 406.9, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 133, 232, 214, 411.3, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 134, 227.5, 215, 404, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 137, 210.5, 218.5, 378.2, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 138, 234.5, 232, 431.2, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 139, 245, 227.5, 438.8, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 140, 214.5, 232.5, 412.7, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 141, 227, 211.5, 409.7, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 142, 214.5, 229.5, 397.3, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 143, 208, 220.5, 390, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 144, 238, 234.5, 443, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 145, 215.5, 211, 397.2, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 150, 210.5, 218.5, 385.1, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 153, 222.5, 213, 400.5, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K022', 155, 230, 206, 398.5, 18, 'brak');


--### PLANICA   2 KONKURS ###--

INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 101, 222.5, 224.5, 396.9, 16, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 102, 232.5, 232.5, 419.8, 11, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 103, 233, 236, 429.4, 5, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 105, 220, 219.5, 388.9, 17, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 107, 197, 212, 348.9, 26, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 109, 202.5, 212, 355.6, 25, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 110, 243.5, 234.5, 439.6, 3, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 111, 217, 211.5, 376.3, 21, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 116, 213.5, 216.5, 377.2, 20, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 118, 214, 214, 370.5, 23, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 119, 240.5, 226, 424.1, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 120, 236.5, 223.5, 423.2, 10, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 122, 245, 234.5, 455.6, 1, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 123, 232, 234.5, 426.9, 7, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 125, 218, 209, 377.7, 19, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 130, 232.5, 224, 409, 12, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 131, 214.5, 208.5, 368.9, 24, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 133, 216.5, 213, 376.1, 22, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 134, 235, 232, 424.1, 8, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 136, 208.5, 205, 347.7, 27, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 137, 202.5, 201.5, 338.5, 28, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 138, 232.5, 237.5, 427.9, 6, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 139, 237, 228, 438.2, 4, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 141, 220, 233, 404.4, 15, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 142, 234, 222, 405.3, 14, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 143, 228.5, 223.5, 405.6, 13, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 144, 243, 236, 440.1, 2, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 145, 203, 192.5, 330.1, 30, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 146, 196, 201.5, 330.4, 29, 'brak');
INSERT INTO WYNIKI(id_konkursu, id_zawodnika, I_Seria, II_Seria, Suma_Pkt, Miejsce, Uwagi) VALUES('K023', 147, 222, 214.5, 386.2, 18, 'brak');

/* SELECT * FROM WYNIKI ORDER BY 1 */

--*********************************************************  DEFINIOWANIE INSTRUKCJI UPDATE *********************************************************-- 

/* AKTUALIZACJA TABELI SKOCZNIE, KOLUMNY PRZYPISY, ZMIANA WARTOSCI BRAK NA DZIENNY */

UPDATE KONKURSY SET PRZYPISY = 'dzienny'
where przypisy like 'brak';

/* AKTUALIZACJA KOLUMNY IMIE W TABELI ZAWODNICY ZAWODNIKA DAIKI ITO, NAZWISKO ZAWIERALO NIEWLASCIWY ZNAK */

UPDATE ZAWODNICY SET NAZWISKO = 'Ito'
where id_zawodnika = 163;

--*********************************************************  DEFINIOWANIE ZAPYTAÑ *********************************************************-- 

--### Z£¥CZENIE ###--

/* ZAPYTANIE ZWRACAJ¥CE ZWYCIÊZCÓW POSZCZEGÓLNYCH KONKURSÓW PUCHARU ŒWIATA */

select '<html><font size="4" color="black"> <b>' || kraj || '</b></font>' || '  -  '|| '<font size="4" color="green"><b>' ||  nazwa  || '</b></font></html>' as "KRAJ - NAZWA_SKOCZNI", data_konkursu, 
'<html><font size="4" color="BLUE"><b>' || nazwisko || '</b></font>' || ' ' || nvl(imie, 'KONKURS ODWOLANY') || '</html>' as PERSONALIA
from zawodnicy join wyniki using(id_zawodnika) full join konkursy using(id_konkursu) join skocznie using(id_skoczni)
where miejsce = 1 or miejsce is null
order by data_konkursu;

--### PODZAPYTANIE ###--

/* ZAPYTANIE ZWRACAJ¥CE WSZYSTKICH ZAWODNIKÓW W BAZIE WRAZ Z LICZBA ZDOBYTYCH PRZEZ NICH PODIUM W CALYM SEZONIE */

select t1.id_zawodnika, nazwisko, imie, count(id_konkursu) as L_pkt_konkursow, nvl(liczba_podium, 0) as Liczba_Podium
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) t1
full join 
(select id_zawodnika, count(*) as liczba_podium from wyniki where miejsce between 1 and 3 group by id_zawodnika) t2 
on (t1.id_zawodnika=t2.id_zawodnika)
where miejsce between 1 and 30
group by t1.id_zawodnika, nazwisko, imie, liczba_podium
order by liczba_podium DESC NULLS LAST, t1.id_zawodnika;

/* ZAPYTANIE ZWRACAJACE PROCENT KONKURSOW SKONCZONYCH PRZEZ DANEGO ZAWODNIKA W CZOLOWEJ 10 BEZ UWZGLEDNIENIA TYCH, KTÓRZY NIE ZROBILI TEGO ANI RAZU */

select id_zawodnika, nazwisko, imie, l_pkt_konkursow, liczba_w_10, round((liczba_w_10/l_pkt_konkursow)*100,2) as procent_wystepow_w_top10
from 
(select id_zawodnika, nazwisko, imie, (select count(*)from wyniki where t1.id_zawodnika =id_zawodnika) as L_pkt_konkursow, count(*) as liczba_w_10
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) t1 
where miejsce between 1 and 10
group by id_zawodnika, nazwisko, imie)
order by 5 DESC, 4, 1;

--### KLAUZULA GROUP BY ###--

/* ZAPYTANIE ZWRACAJACE WSZYSTKICH ZAWODNIKÓW W BAZIE WRAZ Z £¥CZNA SUM¥ OSI¥GNIETYCH PRZEZ NICH ODLEG£OŒCI W ZAWODACH, 
W KTORYCH PUNKTOWALI I ŒREDNIA ODLEG£OŒCI NA JEDNA SERIE KONKURSU */

select id_zawodnika, nazwisko, imie, count(*) as liczba_pkt_konkursow, 
sum(I_seria + II_seria) as laczna_suma_odleglosci, round((sum(I_seria + II_seria)/count(*))/2,1) as srednia_odleglosc_na_serie
from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni) 
where miejsce between 1 and 30
group by id_zawodnika, nazwisko, imie
order by  5 desc;

--### KLAUZULA HAVING ###--

/* ZAPYTANIE ZWRACAJ¥CE WSZYSTKICH ZAWODNIKÓW, KTÓRYCH SREDNIA SUMA PKT W KONKURSACH, 
W KTÓRYCH PUNKTOWALI JEST WIÊKSZA NI¯ ŒREDNIA SUMA PKT OGÓ£EM, UWZGLÊDNIAJ¥C TYLKO TYCH ZAWODNIKÓW, KTÓRZY PUNKTOWALI PRZYNAJMNNIEJ W 6 ZAWODACH */

select id_zawodnika, nazwisko, imie, count(*) as l_pkt_konkursow, round(sum(suma_pkt)/count(*),1) as srednia_pkt_na_konkurs, 
(select round(avg(suma_pkt), 1) from wyniki) as srednia_ogolem
from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)
where miejsce between 1 and 30
group by id_zawodnika, nazwisko, imie
having round(sum(suma_pkt)/count(*),1) > (select round(avg(suma_pkt), 1) from wyniki) and count(*) > 5
order by 5 DESC; 


--$$$ ROZSZERZONY $$$ ---

--### KLAUZULA UNION ###--

/* ZAPYTANIE ZWRACAJACE NAJLMODSZYCH I NASTARSZYCH SKOCZKOW*/

select 'najstarszy zawodnik' as komentarz, nazwisko || ' ' || imie as personalia, wiek, narodowosc  
from (select id_zawodnika, nazwisko, imie, narodowosc, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)
where id_zawodnika in (select id_zawodnika from
(select id_zawodnika, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)
where  wiek in (select max(wiek) from (select id_zawodnika, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)))
union
select 'najmlodszy zawodnik' as komentarz, nazwisko || ' ' || imie as personalia, wiek, narodowosc  
from (select id_zawodnika, nazwisko, imie, narodowosc, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)
where id_zawodnika in (select id_zawodnika from
(select id_zawodnika, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)
where  wiek in (select min(wiek) from (select id_zawodnika, round(('2017'-extract(year from data_ur))) as wiek from zawodnicy)));

--### KLAUZULA IN ###--

/* ZAPYTANIE ZWRACAJACE WSZYSTKICH ZAWODNIKOW, KTORZY PRZYNAJMNIEJ RAZ ODDALI SKOK NA POWZYEJ 230m*/

select distinct id_zawodnika, nazwisko, imie
from zawodnicy join wyniki using(id_zawodnika)
where id_zawodnika in (select id_zawodnika from wyniki where I_seria > 230 or II_seria > 230);


--*********************************************************  TWORZENIE PERSPEKTYW *********************************************************-- 

--### PERSPEKTYWA KLASYFIKACJI GENERALNEJ PUCHARU ŒWIATA ###--

CREATE VIEW PUCHAR_SWIATA as
select id_zawodnika, nazwisko, imie, (select count(id_konkursu) from wyniki where id_zawodnika = t1.id_zawodnika) as L_pkt_konkursow, 
(select count(*) from wyniki where miejsce = 1 and id_zawodnika = t1.id_zawodnika) as "1_miejsce", 
(select count(*) from wyniki where miejsce = 2 and id_zawodnika = t1.id_zawodnika) as "2_miejsce", 
(select count(*) from wyniki where miejsce = 3 and id_zawodnika = t1.id_zawodnika) as "3_miejsce",
(select count(*) from wyniki where miejsce between 1 and 3 and id_zawodnika = t1.id_zawodnika) as Liczba_podium,
sum(pkt) as PUNKTY
from (select id_zawodnika, nazwisko, imie, miejsce,
case 
when miejsce = 1 then 100
when miejsce = 2 then 80
when miejsce = 3 then 60
when miejsce = 4 then 50
when miejsce = 5 then 45
when miejsce = 6 then 40
when miejsce = 7 then 36
when miejsce = 8 then 32
when miejsce = 9 then 29
when miejsce = 10 then 26
when miejsce = 11 then 24
when miejsce = 12 then 22
when miejsce = 13 then 20
when miejsce = 14 then 18
when miejsce = 15 then 16
when miejsce = 16 then 15
when miejsce = 17 then 14
when miejsce = 18 then 13
when miejsce = 19 then 12
when miejsce = 20 then 11
when miejsce = 21 then 10
when miejsce = 22 then 9
when miejsce = 23 then 8
when miejsce = 24 then 7
when miejsce = 25 then 6
when miejsce = 26 then 5
when miejsce = 27 then 4
when miejsce = 28 then 3
when miejsce = 29 then 2
when miejsce = 30 then 1
end as pkt
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) 
where miejsce between 1 and 30) t1
group by id_zawodnika, nazwisko, imie
order by 9 DESC;

/* SELECT * FROM PUCHAR_SWIATA; */

--### PERSPEKTYWA KLASYFIKACJI GENERALNEJ TURNIEJU CZTERECH SKOCZNI ###--

CREATE VIEW TURNIEJ_CZTERECH_SKOCZNI as
select id_zawodnika, imie, nazwisko, count(*) as Liczba_wystepow, 
nvl((select sum(suma_pkt) from wyniki where id_konkursu like 'K008' and t1.id_zawodnika = id_zawodnika group by id_zawodnika),0) as "1_konkurs", 
nvl((select sum(suma_pkt) from wyniki where id_konkursu like 'K009' and t1.id_zawodnika = id_zawodnika group by id_zawodnika),0) as "2_konkurs",
nvl((select sum(suma_pkt) from wyniki where id_konkursu like 'K010' and t1.id_zawodnika = id_zawodnika group by id_zawodnika),0) as "3_konkurs",
nvl((select sum(suma_pkt) from wyniki where id_konkursu like 'K011' and t1.id_zawodnika = id_zawodnika group by id_zawodnika),0) as "4_konkurs",
sum(suma_pkt) as SUMA_PKT
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) t1
where szczegoly like 'TCS'
group by id_zawodnika, imie, nazwisko
order by 9 DESC;

/* SELECT * FROM TURNIEJ_CZTERECH_SKOCZNI; */

--### PERSPEKTYWA KLASYFIKACJI PUCHARU ŒWIATA W LOTACH ###--

CREATE VIEW PUCHAR_SWIATA_W_LOTACH as
select id_zawodnika, nazwisko, imie, (select count(id_konkursu) from wyniki join konkursy using(id_konkursu)where id_zawodnika = t1.id_zawodnika and przypisy like 'loty') as L_pkt_konkursow, sum(pkt) as PUNKTY
from (select id_zawodnika, nazwisko, imie, miejsce,
case 
when miejsce = 1 then 100
when miejsce = 2 then 80
when miejsce = 3 then 60
when miejsce = 4 then 50
when miejsce = 5 then 45
when miejsce = 6 then 40
when miejsce = 7 then 36
when miejsce = 8 then 32
when miejsce = 9 then 29
when miejsce = 10 then 26
when miejsce = 11 then 24
when miejsce = 12 then 22
when miejsce = 13 then 20
when miejsce = 14 then 18
when miejsce = 15 then 16
when miejsce = 16 then 15
when miejsce = 17 then 14
when miejsce = 18 then 13
when miejsce = 19 then 12
when miejsce = 20 then 11
when miejsce = 21 then 10
when miejsce = 22 then 9
when miejsce = 23 then 8
when miejsce = 24 then 7
when miejsce = 25 then 6
when miejsce = 26 then 5
when miejsce = 27 then 4
when miejsce = 28 then 3
when miejsce = 29 then 2
when miejsce = 30 then 1
end as pkt
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) 
where miejsce between 1 and 30 and przypisy like 'loty') t1
group by id_zawodnika, nazwisko, imie
order by 5 DESC;

/* SELECT * FROM PUCHAR_SWIATA_W_LOTACH; */

--### PERSPEKTYWA KLASYFIKACJI UPROSZCZONEGO PUCHARU NARODOW ###--

CREATE VIEW PUCHAR_NARODOW as
select narodowosc as KRAJ, sum(pkt) as PUNKTY
from (select narodowosc,
case 
when miejsce = 1 then 100
when miejsce = 2 then 80
when miejsce = 3 then 60
when miejsce = 4 then 50
when miejsce = 5 then 45
when miejsce = 6 then 40
when miejsce = 7 then 36
when miejsce = 8 then 32
when miejsce = 9 then 29
when miejsce = 10 then 26
when miejsce = 11 then 24
when miejsce = 12 then 22
when miejsce = 13 then 20
when miejsce = 14 then 18
when miejsce = 15 then 16
when miejsce = 16 then 15
when miejsce = 17 then 14
when miejsce = 18 then 13
when miejsce = 19 then 12
when miejsce = 20 then 11
when miejsce = 21 then 10
when miejsce = 22 then 9
when miejsce = 23 then 8
when miejsce = 24 then 7
when miejsce = 25 then 6
when miejsce = 26 then 5
when miejsce = 27 then 4
when miejsce = 28 then 3
when miejsce = 29 then 2
when miejsce = 30 then 1
end as pkt
from (select * from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) 
where miejsce between 1 and 30) t1
group by narodowosc
order by 2 DESC;

/* SELECT * FROM PUCHAR_NARODOW; */

--### PERSPEKTYWA ZAWODNIKOW, KTÓRZY STAWALI NA PODIUM  W KONKURSIE W SWOIM KRAJU ###--

CREATE VIEW PODIA_NA_SWOIM_TERENIE as
select id_zawodnika, nazwisko, imie, kraj, count(*) as Liczba_podium, listagg(miasto || ': ' || nazwa || ' - ' || miejsce || ', ') within group(order by id_zawodnika) as PODIA from
(select id_skoczni, kraj, miasto, nazwa, id_zawodnika, nazwisko, imie, miejsce 
from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)
where (miejsce between 1 and 3) and narodowosc=kraj)
group by id_zawodnika, nazwisko, imie, kraj
order by 5;

/* SELECT * FROM PODIA_NA_SWOIM_TERENIE; */

--### PERSPEKTYWA ZAWODNIKOW Z TEGO SAMEGO KRAJU, KTÓRZY W JEDNYM KONKURSIE WSPOLNIE STANELI NA PODIUM ###--

CREATE VIEW WSPOLNE_PODIUM as
select t1.id_konkursu, kraj, miasto, nazwa, t1.narodowosc || ': ' || regexp_replace((listagg(t1.nazwisko, ',') within group (order by t1.miejsce, t1.id_zawodnika)), '([^,]*)(,\1)+($|,)','\1\3') as Wspolne_podium from
(select id_konkursu, id_zawodnika, narodowosc, kraj, nazwa, miasto, nazwisko, miejsce from zawodnicy join wyniki using(id_zawodnika) join konkursy using(id_konkursu) join skocznie using(id_skoczni)) t1
join
(select id_konkursu, id_zawodnika, narodowosc, nazwisko, miejsce from zawodnicy join wyniki using(id_zawodnika)) t2
on(t1.id_konkursu=t2.id_konkursu)
where t1.narodowosc=t2.narodowosc 
and ((t1.miejsce=1 and t2.miejsce=2) or (t2.miejsce=1 and t1.miejsce=2) or ((t1.miejsce=3 and t2.miejsce=2) or (t1.miejsce=2 and t2.miejsce=3)) or (t1.miejsce=3 and t2.miejsce=1) or (t1.miejsce=1 and t2.miejsce=3)) 
group by t1.id_konkursu, kraj, miasto, nazwa, t1.narodowosc;

/* SELECT * FROM WSPOLNE_PODIUM; */



--*********************************************************  DROPOWANIE TABEL, SEKWENCJI I PERSPEKTYW *********************************************************--          
         
/* 
drop view wspolne_podium;
drop view podia_na_swoim_terenie;
drop view puchar_narodow;
drop view puchar_swiata_w_lotach;
drop view turniej_czterech_skoczni;
drop view puchar_swiata;
drop sequence zawodnicy_seq;
drop table wyniki cascade constraints;
drop table konkursy cascade constraints;
drop table skocznie cascade constraints;
drop table zawodnicy cascade constraints;
*/




