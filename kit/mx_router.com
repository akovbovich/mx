$ SET NOON
$loop:
$ RUN MX_EXE:MX_ROUTER.EXE
$ status = F$INTEGER ($STATUS) .AND. %XFFFF
$ IF status .EQ. %X0C THEN GOTO loop
$ EXIT 'status'
