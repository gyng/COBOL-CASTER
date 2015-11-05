IDENTIFICATION DIVISION.
PROGRAM-ID. DOT.

DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 tmp1 PIC S9(8)V9(2) VALUE IS 0.
        01 tmp2 PIC S9(8)V9(2) VALUE IS 0.

        LINKAGE SECTION.
        01 v1x PIC S9(8)V9(2).
        01 v1y PIC S9(8)V9(2).
        01 v1z PIC S9(8)V9(2).
        01 v2x PIC S9(8)V9(2).
        01 v2y PIC S9(8)V9(2).
        01 v2z PIC S9(8)V9(2).
        01 ret PIC S9(8)V9(2).

PROCEDURE DIVISION USING v1x, v1y, v1z, v2x, v2y, v2z, ret.
        MULTIPLY v1x BY v2x GIVING ret.
        MULTIPLY v1y BY v2y GIVING tmp1.
        MULTIPLY v1z BY v2z GIVING tmp2.
        ADD tmp1, tmp2 TO ret.
EXIT PROGRAM.
