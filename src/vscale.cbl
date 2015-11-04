IDENTIFICATION DIVISION.
PROGRAM-ID. VSCALE.

DATA DIVISION.
        LINKAGE SECTION.
        01 v1x   PIC S9(8)V9(2).
        01 v1y   PIC S9(8)V9(2).
        01 v1z   PIC S9(8)V9(2).
        01 scale PIC S9(8)V9(2).
        01 retx  PIC S9(8)V9(2).
        01 rety  PIC S9(8)V9(2).
        01 retz  PIC S9(8)V9(2).

PROCEDURE DIVISION USING v1x, v1y, v1z, scale, retx, rety, retz.
        MULTIPLY v1x BY scale GIVING retx.
        MULTIPLY v1y BY scale GIVING rety.
        MULTIPLY v1z BY scale GIVING retz.
EXIT PROGRAM.
