#
#  MMS build file for MX_FLQ_SHR.EXE
#
#  Written by Hunter Goatley, 15-NOV-1993 10:48
#
#

MX_FACILITY = FLQ
.INCLUDE [-]MMSDEFS.MMS

.IFDEF __VAX__
VEC = ,$(BINDIR)FLQ_VECTOR.OBJ
.ELSE
VEC	=
.ENDIF

SHR_OBJ =	FLQ_OPEN,-
		FLQ_CLOSE,-
		FLQ_ADD,-
		FLQ_PURGE,-
		FLQ_READ,-
		FLQ_REMOVE,-
		FLQ_SEARCH,-
		FLQ_SYNCH_BITMAP,-
		FLQ_UPDATE,-
		FLQ___ROUTINES,-
		FLQ_MAKE_FSPEC,-
    	    	FLQ_GET_MAXSIZE,-
		FLQ_MSG

$(BINDIR)MX_FLQ_SHR.EXE : $(BINDIR)MX_FLQ_SHR.OLB($(SHR_OBJ)),MX_FLQ_SHR$(OPT)$(VEC)
    $(LINK)/NOTRACE$(LINKFLAGS)/SHARE MX_FLQ_SHR$(OPT)/OPT,$(VERSION)

$(BINDIR)FLQ_OPEN.OBJ,-
$(BINDIR)FLQ_READ.OBJ,-
$(BINDIR)FLQ_UPDATE.OBJ,-
$(BINDIR)FLQ_PURGE.OBJ,-
$(BINDIR)FLQ_REMOVE.OBJ,-
$(BINDIR)FLQ_SEARCH.OBJ,-
$(BINDIR)FLQ_SYNCH_BITMAP.OBJ,-
$(BINDIR)FLQ___ROUTINES.OBJ 	: FLQ_PRIVATE_DEFS$(L32), FLQ_DEFS$(L32), $(MX_SRC_COMMON)IPC$(L32)
$(BINDIR)FLQ_CLOSE.OBJ,-
$(BINDIR)FLQ_GET_MAXISZE.OBJ,-
$(BINDIR)FLQ_MAKE_FSPEC.OBJ 	: FLQ_PRIVATE_DEFS$(L32), FLQ_DEFS$(L32)

FLQ_PRIVATE_DEFS$(L32)	:	$(MX_SRC_COMMON)FIELDS$(L32)
FLQ_DEFS$(L32)		:	$(MX_SRC_COMMON)FIELDS$(L32)

PREFETCH :  	FLQ_VECTOR.MAR,MX_FLQ_SHR.OPT,MX_FLQ_SHR.ALPHA_OPT

TEST :		$(BINDIR)TEST_READ.EXE,$(BINDIR)TEST_add.EXE,-
    	    	$(BINDIR)test_remove.exe,$(BINDIR)test_update.exe
	!

$(BINDIR)TEST_READ.EXE :	$(BINDIR)TEST_READ.OBJ,$(BINDIR)MX_FLQ_SHR.OLB
	$(LINK)/DEBUG	$(BINDIR)TEST_READ,$(BINDIR)MX_FLQ_SHR.OLB/LIBRARY

$(BINDIR)TEST_ADD.EXE :	        $(BINDIR)TEST_ADD.OBJ,$(BINDIR)MX_FLQ_SHR.OLB
	$(LINK)/DEBUG	$(BINDIR)TEST_ADD,$(BINDIR)MX_FLQ_SHR.OLB/LIBRARY

$(BINDIR)TEST_REMOVE.EXE :	$(BINDIR)TEST_REMOVE.OBJ,$(BINDIR)MX_FLQ_SHR.OLB
	$(LINK)/DEBUG	$(BINDIR)TEST_REMOVE,$(BINDIR)MX_FLQ_SHR.OLB/LIBRARY

$(BINDIR)TEST_UPDATE.EXE :	$(BINDIR)TEST_UPDATE.OBJ,$(BINDIR)MX_FLQ_SHR.OLB
	$(LINK)/DEBUG	$(BINDIR)TEST_UPDATE,$(BINDIR)MX_FLQ_SHR.OLB/LIBRARY
