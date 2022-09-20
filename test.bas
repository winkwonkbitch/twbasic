    5 DIM i as STRING
   10 DIM inc as INTEGER
   20 inc = 1
   30 IF inc < 3 THEN
   40   PRINT "Run #"inc
   50   inc = inc + 1
   60   PRINT "Say something"
   70   INPUT i
   80   PRINT "You said:"i
   90   GOTO 30
  100 END IF
  110 PRINT "Done!"
  120 END

