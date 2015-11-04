IDENTIFICATION DIVISION.
PROGRAM-ID. VNORM.

DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 tmpx PIC S9(13)V9(2).
        01 tmpy PIC S9(13)V9(2).
        01 tmpz PIC S9(13)V9(2).
        01 len  PIC S9(13)V9(2).

        LINKAGE SECTION.
        01 vx PIC S9(8)V9(2).
        01 vy PIC S9(8)V9(2).
        01 vz PIC S9(8)V9(2).

PROCEDURE DIVISION USING vx, vy, vz.
*>      Avoid overflow here
        MULTIPLY vx BY vx GIVING tmpx.
        MULTIPLY vy BY vy GIVING tmpy.
        MULTIPLY vz BY vz GIVING tmpz.
        ADD tmpx, tmpy to tmpz GIVING len.
        COMPUTE len = FUNCTION SQRT (len).

        DIVIDE len INTO vx.
        DIVIDE len INTO vy.
        DIVIDE len INTO vz.
EXIT PROGRAM.
