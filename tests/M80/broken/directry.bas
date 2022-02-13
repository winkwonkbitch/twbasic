5 RESET
9 PRINT TAB(21);
10 PRINT "DIRECTORY"
19 PRINT TAB(7);
20 PRINT "CHOOSE ONE OF THE FOLLOWING BY NUMBER:"
29 PRINT TAB(10);
30 PRINT "1. EXAMINE a record on file"
39 PRINT TAB(10);
40 PRINT "2. ADD     a record to the file"
49 PRINT TAB(10);
50 PRINT "3. DELETE  a record from the file"
59 PRINT TAB(10);
60 PRINT "4. PRINT OUT the entire file"
69 PRINT TAB(21);
70 INPUT "Input #: ",CHOICE
72 IF CHOICE<1 THEN 70
73 IF CHOICE>4 THEN 70
75 ON CHOICE GOTO 80, 120, 130, 170
80 MATCH=0
81 GOSUB 600
83 IF MATCH = 0 THEN 9
84 LAST.NAME$ = L$
85 FIRST.NAME$ = F$
86 STREET$ = S$
87 CITY$ = C$
88 STATE$ = ST$
89 ZIP$ = Z$
90 TELEPHONE$ = T$
92 GOSUB 300
93 IF MID$(RESPONSE$,1,1)="N" THEN 9
94 GOSUB 200
95 GOSUB 300
96 IF MID$(RESPONSE$,1,1)="Y" THEN 94
97 IF L$+F$ <>LAST.NAME$+FIRST.NAME$ THEN 112
99 OPEN "R",1,"DIRECTRY.DAT",104
100 FIELD #1,20 AS L$,20 AS F$,25 AS S$,20 AS C$,2 AS ST$,5 AS Z$,12 AS T$
101 LSET L$ = LAST.NAME$
102 LSET F$ = FIRST.NAME$
103 LSET S$ = STREET$
104 LSET C$ = CITY$
105 LSET ST$ = STATE$
106 LSET Z$ = ZIP$
107 LSET T$ = TELEPHONE$
108 PUT #1, RECORD.NUMBER
109 CLOSE #1
110 GOTO 9
112 PRINT "LAST AND FIRST NAMES MAY NOT BE CHANGED."
114 PRINT "YOUR MUST DELETE THE OLD RECORD AND THEN"
116 PRINT "ADD THE NEW ONE."
118 INPUT "PRESS RETURN TO CONTINUE",Y$
119 GOTO 9
120 GOSUB 200
122 GOSUB 300
124 IF MID$(RESPONSE$,1,1)="Y" THEN 120
126 GOSUB 400
128 GOTO 9
130 GOSUB 500
132 GOTO 9
170 OPEN "R", 1,"DIRECTRY.DAT",104
172 FIELD #1, 104 AS ENTIRE.RECORD$
174 LPRINT "DIRECTORY": LPRINT
176 GET #1
177 IF EOF(1)=-1 THEN 192
178 LPRINT MID$(ENTIRE.RECORD$,21,20)
179 LPRINT MID$(ENTIRE.RECORD$,1,20)
180 LPRINT MID$(ENTIRE.RECORD$,41,25)
182 LPRINT MID$(ENTIRE.RECORD$,66,20)
184 LPRINT MID$(ENTIRE.RECORD$,86,2)
186 LPRINT MID$(ENTIRE.RECORD$,88,5)
188 LPRINT MID$(ENTIRE.RECORD$,93,12)
189 LPRINT: LPRINT: LPRINT
190 GOTO 176
192 CLOSE #1
194 GOTO 9
200 REM ********** INPUT ROUTINE **********
202 PRINT CHR$(26)
204 GOSUB 244
206 PRINT TAB(21); "DIRECTORY"
208 PRINT TAB(12); "PLEASE SUPPLY THE FOLLOWING:"
210 GOSUB 244
212 PRINT TAB(8);
214 INPUT "Last Name:              ",LAST.NAME$
216 PRINT TAB(8);
218 INPUT "First Name:             ",FIRST.NAME$
219 GOSUB 700
220 PRINT TAB(8);
222 INPUT "Street Address:         ",STREET$
224 PRINT TAB(8);
226 INPUT "City:                   ",CITY$
228 PRINT TAB(8);
230 INPUT "State (ex: NY):         ",STATE$
232 PRINT TAB(8);
234 INPUT "Zip Code:               ",ZIP$
236 PRINT TAB(8);
238 INPUT "Telephone (###-####):   ",TELEPHONE$
240 GOSUB 244
242 RETURN
244 FOR I = 1 TO 5
246     PRINT
248 NEXT I
250 RETURN
300 REM ************* OUTPUT ROUTINE **********
302 PRINT CHR$(26)
304 GOSUB 336
306 PRINT TAB(21);"DIRECTORY"
308 GOSUB 336
310 PRINT TAB(8); "Last Name:             "; LAST.NAME$
312 PRINT TAB(8); "First Name:            "; FIRST.NAME$
314 PRINT TAB(8); "Street Address:        "; STREET$
316 PRINT TAB(8); "City:                  "; CITY$
318 PRINT TAB(8); "State:                 "; STATE$
320 PRINT TAB(8); "Zip Code:              "; ZIP$
322 PRINT TAB(8); "Tel (###-####):        "; TELEPHONE$
324 GOSUB 336
325 REM PRINT "DO YOU WISH TO MAKE ANY CHANGES"; RESPONSE$
326 INPUT "DO YOU WISH TO MAKE ANY CHANGES"; RESPONSE$
328 IF MID$(RESPONSE$,1,1) = "Y" THEN 334
330 IF MID$(RESPONSE$,1,1) <> "N" THEN 326
332 RETURN
334 GOTO 332
336 FOR I = 1 TO 5
338     PRINT
340 NEXT I
342 RETURN
400 REM ************* ADD ROUTINE *************
402 PRINT CHR$(26)
404 MARKER = 0
406 FULL.NAME$ = LAST.NAME$ + FIRST.NAME$
408 OPEN "R", 1, "DIRECTRY.DAT", 104
410 OPEN "R", 2, "UPDATE.DAT", 104
412 FIELD #1,20 AS L$,20 AS F$,25 AS S$,20 AS C$,2 AS ST$,5 AS Z$,12 AS T$
414 FIELD #2,20 AS A$,20 AS B$,25 AS D$,20 AS E$,2 AS G$,5 AS H$,12 AS I$
416 GET #1
418 IF EOF(1) = -1 THEN 452
420 IF MARKER = 1 THEN 434
422 GOSUB 462
424 IF F.N$ <> FULL.NAME$ THEN 434
426 PRINT TAB(11);"THAT RECORD IS ALREADY ON FILE."
428 INPUT "PRESS RETURN TO CONTINUE.",Y$
429 CLOSE #1: CLOSE #2
430 KILL "UPDATE.DAT"
432 GOTO 460
434 LSET A$ = L$
436 LSET B$ = F$
438 LSET D$ = S$
440 LSET E$ = C$
442 LSET G$ = ST$
444 LSET H$ = Z$
446 LSET I$ = T$
448 PUT #2
450 GOTO 416
452 IF MARKER = 1 THEN 455
454 GOSUB 466
455 CLOSE #1: CLOSE #2
456 KILL "DIRECTRY.DAT"
458 NAME "UPDATE.DAT" AS "DIRECTRY.DAT"
460 RETURN : CLOSE #1: CLOSE #2: RETURN
462 IF F.N$ <=FULL.NAME$ THEN 482
466 LSET A$ = LAST.NAME$
468 LSET B$ = FIRST.NAME$
470 LSET D$ = STREET$
472 LSET E$ = CITY$
474 LSET I$ = TELEPHONE$
476 LSET H$ = ZIP$
478 LSET I$ = TELEPHONE$
480 PUT #2: MARKER = 1
482 RETURN
500 REM *********** DELETE ROUTINE *********
502 MARKER = 0
504 PRINT CHR$(26)
506 PRINT TAB(7);
508 PRINT "FOR THE RECORD THAT YOU WISH TO DELETE:"
510 PRINT TAB(15);
516 INPUT "FIRST NAME: ",FIRST.NAME$
517 GOSUB 700
518 FULL.NAME$ = LAST.NAME$ + FIRST.NAME$
520 OPEN "R", 1, "DIRECTRY.DAT", 104
522 OPEN "R", 2, "UPDATE.DAT", 104
524 FIELD #1, 40 AS F.N$, 64 AS REST$
526 FIELD #2, 40 AS F.N2$, 64 AS REST2$
528 GET #1
530 IF EOF(1)=-1 THEN 546
532 IF MARKER = 0 THEN IF F.N$ = FULL.NAME$ THEN 542
534 LSET F.N2$ = F.N$
536 LSET REST2$ = REST$
538 PUT #2
540 GOTO 528
542 MARKER = 1
544 GOTO 528
546 IF MARKER = 1 THEN 555
548 PRINT: PRINT: PRINT TAB(17);
550 PRINT "RECORD NOT ON FILE."
552 PRINT: PRINT TAB(14);
554 INPUT "PRESS RETURN TO CONTINUE",Y$
555 CLOSE #1: CLOSE #2
556 KILL "DIRECTRY.DAT"
558 NAME "UPDATE.DAT" AS "DIRECTRY.DAT"
560 CLOSE #1: CLOSE #2: RETURN
600 REM ********** SEARCH ROUTINE **********
602 PRINT CHR$(26)
604 OPEN "R", 1, "DIRECTRY.DAT", 104
606 FIELD #1,20 AS L$,20 AS F$,25 AS S$,20 AS C$,2 AS ST$,5 AS Z$,12 AS T$
608 GOSUB 652
610 PRINT TAB(12);
612 PRINT "PLEASE SUPPLY THE FOLLOWING:"
614 GOSUB 652
616 PRINT TAB(15);
618 INPUT "LAST NAME:     ";LAST.NAME$
620 PRINT TAB(15);
622 INPUT "FIRST NAME:    ";FIRST.NAME$
623 GOSUB 700
624 RECORD.NUMBER = 1
626 GET #1, RECORD.NUMBER
628 IF L$ <> LAST.NAME$ THEN 634
630 IF F$ <> FIRST.NAME$ THEN 634
631 MATCH = 1
632 CLOSE #1: RETURN
634 IF EOF(1) <> -1 THEN 648
636 GOSUB 652
638 PRINT TAB(17);
640 PRINT "RECORD NOT ON FILE."
642 PRINT: PRINT TAB(14);
644 PRINT "PRESS RETURN TO CONTINUE.",Y$
646 GOTO 632
648 RECORD.NUMBER = RECORD.NUMBER + 1
650 GOTO 626
652 FOR P = 1 TO 6
654     PRINT
656 NEXT P
658 RETURN
700 SPACER$="                      "
710 LAST.NAME$ = LAST.NAME$+SPACER$
720 LAST.NAME$ = MID$(LAST.NAME$,1,20)
730 FIRST.NAME$ = FIRST.NAME$+SPACER$
740 FIRST.NAME$ = MID$(FIRST.NAME$,1,20)
750 RETURN