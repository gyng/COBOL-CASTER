IDENTIFICATION DIVISION.
PROGRAM-ID. VSUB.

DATA DIVISION.
        LINKAGE SECTION.
        01 v1x  PIC S9(8)V9(2).
        01 v1y  PIC S9(8)V9(2).
        01 v1z  PIC S9(8)V9(2).
        01 v2x  PIC S9(8)V9(2).
        01 v2y  PIC S9(8)V9(2).
        01 v2z  PIC S9(8)V9(2).
        01 retx PIC S9(8)V9(2).
        01 rety PIC S9(8)V9(2).
        01 retz PIC S9(8)V9(2).

PROCEDURE DIVISION USING v1x, v1y, v1z, v2x, v2y, v2z, retx, rety, retz.
        SUBTRACT v1x FROM v2x GIVING retx.
        SUBTRACT v1y FROM v2y GIVING rety.
        SUBTRACT v1z FROM v2z GIVING retz.
EXIT PROGRAM.
