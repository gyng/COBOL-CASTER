IDENTIFICATION DIVISION.
PROGRAM-ID. VCROSS.

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
        COMPUTE retx = (v1y * v2z) - (v1z * v2y).
        COMPUTE rety = (v1z * v2x) - (v1x * v2z).
        COMPUTE retz = (v1x * v2y) - (v1y * v2x).
EXIT PROGRAM.
