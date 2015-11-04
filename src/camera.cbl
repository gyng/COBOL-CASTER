IDENTIFICATION DIVISION.
PROGRAM-ID. GET-CAM-RAY-DIR.

DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 cx    PIC S9(8)V9(2) VALUE IS 2.
        01 cy    PIC S9(8)V9(2) VALUE IS 0.
        01 cz    PIC S9(8)V9(2) VALUE IS 0.
        01 clax  PIC S9(8)V9(2) VALUE IS 0.
        01 clay  PIC S9(8)V9(2) VALUE IS 0.
        01 claz  PIC S9(8)V9(2) VALUE IS 0.
        01 upx   PIC S9(8)V9(2) VALUE IS 0.
        01 upy   PIC S9(8)V9(2) VALUE IS 0.
        01 upz   PIC S9(8)V9(2) VALUE IS 1.
        01 fov   PIC S9(8)V9(2) VALUE IS 0.79.
        01 ratio PIC S9(8)V9(2).
        01 halfw PIC S9(8)V9(2).
        01 halfh PIC S9(8)V9(2).
        01 eyex  PIC S9(8)V9(2) VALUE IS 0.
        01 eyey  PIC S9(8)V9(2) VALUE IS 0.
        01 eyez  PIC S9(8)V9(2) VALUE IS 0.
        01 rx    PIC S9(8)V9(2) VALUE IS 0.
        01 ry    PIC S9(8)V9(2) VALUE IS 0.
        01 rz    PIC S9(8)V9(2) VALUE IS 0.
        01 camw  PIC S9(8)V9(2).
        01 camh  PIC S9(8)V9(2).
        01 pixw  PIC S9(8)V9(2).
        01 pixh  PIC S9(8)V9(2).
        01 tmp   PIC S9(8)V9(2) VALUE IS 0.
        01 tupx  PIC S9(8)V9(2).
        01 tupy  PIC S9(8)V9(2).
        01 tupz  PIC S9(8)V9(2).

        LINKAGE SECTION.
        01 x   PIC S9(8)V9(2).
        01 y   PIC S9(8)V9(2).
        01 w   PIC S9(8)V9(2).
        01 h   PIC S9(8)V9(2).
        01 vox PIC S9(8)V9(2).
        01 voy PIC S9(8)V9(2).
        01 voz PIC S9(8)V9(2).
        01 vx  PIC S9(8)V9(2).
        01 vy  PIC S9(8)V9(2).
        01 vz  PIC S9(8)V9(2).

PROCEDURE DIVISION USING x, y, w, h, vox, voy, voz, vx, vy, vz.
        CALL 'VSUB' USING cx, cy, cz, clax, clay, claz, eyex, eyey, eyez.
        CALL 'VNORM' USING eyex, eyey, eyez.
        CALL 'VCROSS' USING eyex, eyey, eyez, upx, upy, upz, rx, ry, rz.

        DIVIDE h BY w GIVING ratio.
        COMPUTE halfw = FUNCTION TAN(fov).
        MULTIPLY ratio BY halfw GIVING halfh.

        MULTIPLY halfw BY 2.0 GIVING camw.
        MULTIPLY halfh BY 2.0 GIVING camh.
        DIVIDE camw BY w GIVING pixw.
        DIVIDE camh BY h GIVING pixh.

        COMPUTE tmp = x * pixw - halfw.

        CALL 'VSCALE' USING rx, ry, rz, tmp, rx, ry, rz.

        COMPUTE tmp = y * pixh - halfh.
        CALL 'VSCALE' USING upx, upy, upz, tmp, tupx, tupy, tupz.

        CALL 'VADD' USING eyex, eyey, eyez, rx, ry, rz, vx, vy, vz.
        CALL 'VADD' USING vx, vy, vz, tupx, tupy, tupz, vx, vy, vz.
        CALL 'VNORM' USING vx, vy, vz.

        MOVE cx TO vox.
        MOVE cy TO voy.
        MOVE cz TO voz.
EXIT PROGRAM.
