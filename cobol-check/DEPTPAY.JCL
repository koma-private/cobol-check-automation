//DEPTPAYJ JOB 1,NOTIFY=&SYSUID
//*******************************************************
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//*******************************************************
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(DEPTPAY),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(DEPTPAY),DISP=SHR
// IF RC = 0 THEN
//RUN     EXEC PGM=DEPTPAY
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
// ENDIF
