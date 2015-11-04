IDENTIFICATION DIVISION.
PROGRAM-ID. VADD.

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
        ADD v1x TO v2x GIVING retx.
        ADD v1y TO v2y GIVING rety.
        ADD v1z TO v2z GIVING retz.
EXIT PROGRAM.
