IDENTIFICATION DIVISION.
PROGRAM-ID. SPHERE-INTERSECT.

DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 a     PIC S9(8)V9(2) VALUE IS 1.
        01 b     PIC S9(8)V9(2) VALUE IS 0.
        01 c     PIC S9(8)V9(2) VALUE IS 0.
        01 tmp   PIC S9(8)V9(2) VALUE IS 0.
        01 disc  PIC S9(8)V9(2) VALUE IS 0.
        01 tmpvx PIC S9(8)V9(2) VALUE IS 0.
        01 tmpvy PIC S9(8)V9(2) VALUE IS 0.
        01 tmpvz PIC S9(8)V9(2) VALUE IS 0.

        LINKAGE SECTION.
        01 sx   PIC S9(8)V9(2).
        01 sy   PIC S9(8)V9(2).
        01 sz   PIC S9(8)V9(2).
        01 r    PIC S9(8)V9(2).
        01 vox  PIC S9(8)V9(2).
        01 voy  PIC S9(8)V9(2).
        01 voz  PIC S9(8)V9(2).
        01 vx   PIC S9(8)V9(2).
        01 vy   PIC S9(8)V9(2).
        01 vz   PIC S9(8)V9(2).
        01 tmin PIC S9(8)V9(2).
        01 tmax PIC S9(8)V9(2).
        01 ret  PIC S9(8)V9(2).

PROCEDURE DIVISION USING sx, sy, sz, r, vox, voy, voz, vx, vy, vz, ret.
        CALL 'VSUB' USING vox, voy, voz, sx, sy, sz, tmpvx, tmpvy, tmpvz.
        CALL 'DOT' USING vx, vy, vz, tmpvx, tmpvy, tmpvz, b.
        MULTIPLY +002.000 BY b.

        CALL 'VSUB' USING sx, sy, sz, vox, voy, voz, tmpvx, tmpvy, tmpvz.
        CALL 'DOT' USING tmpvx, tmpvy, tmpvz, tmpvx, tmpvy, tmpvz, c.

        COMPUTE c = r * r * c.
        COMPUTE disc = b * b - (4 * a * c).

*>      This is an incomplete implemenation: need to check for t_min and t_max
*>      Right now it considers intersections with spheres behind the ray
        IF disc < 0.0 THEN
           MOVE 0.0 TO ret
        ELSE
           MOVE 1.0 TO ret
        END-IF.
EXIT PROGRAM.
