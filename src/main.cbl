IDENTIFICATION DIVISION.
PROGRAM-ID. COBOLRAYCASTER.

DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 spheres.
           02 sphere PIC S9(8)V9(2) OCCURS 4 TIMES.
        01 cvox  PIC S9(8)V9(2).
        01 cvoy  PIC S9(8)V9(2).
        01 cvoz  PIC S9(8)V9(2).
        01 cvx   PIC S9(8)V9(2).
        01 cvy   PIC S9(8)V9(2).
        01 cvz   PIC S9(8)V9(2).
        01 ret   PIC S9(8)V9(2) VALUE IS 0.
        01 x     PIC S9(8)V9(2) VALUE IS 0.
        01 y     PIC S9(8)V9(2) VALUE IS 0.
        01 w     PIC S9(8)V9(2) VALUE IS 80.
        01 h     PIC S9(8)V9(2) VALUE IS 20.

PROCEDURE DIVISION.
*>      The only sphere! Located at origin, radius 1.
        MOVE '0000000000000000000000000000000000000100' TO spheres.

        PERFORM VARYING y FROM 0 BY 1 UNTIL y > h
           PERFORM VARYING x FROM 0 BY 1 UNTIL x > w
              CALL 'GET-CAM-RAY-DIR' USING
                 x, y, w, h
                 cvox, cvoy, cvoz,
                 cvx, cvy, cvz
              CALL 'SPHERE-INTERSECT' USING
                 sphere(1), sphere(2), sphere(3), sphere(4),
                 cvox, cvoy, cvoz,
                 cvx, cvy, cvz, ret
*>            Awful shading (intersect = solid 'X')
              IF ret > 0.1 THEN
                 DISPLAY 'X' WITH NO ADVANCING
              ELSE
                 DISPLAY '.' WITH NO ADVANCING
              END-IF
           END-PERFORM
           DISPLAY ' '
        END-PERFORM.
        STOP RUN.
