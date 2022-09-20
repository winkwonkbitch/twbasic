#############################################
#         UNIX Makefile for TWBasic         #
#       Written (poorly) by 01001100        #
#                                           #
#          Modify name, CC, bindir          #
#             and CFlags needed             #
#############################################

name=twbasic
CC=gcc
bindir='/usr/bin'
CFlags=-lm -ansi
deps=bwb_cmd.c bwb_dio.c bwb_fnc.c bwb_int.c bwb_stc.c bwb_tbl.c bwbasic.c bwbasic.h bwd_fun.c bwx_tty.c bwb_cnd.c bwb_exp.c bwb_inp.c bwb_prn.c bwb_str.c bwb_var.c bwd_cmd.c bwd_six.h
dotc=bwb_cmd.c bwb_dio.c bwb_fnc.c bwb_int.c bwb_stc.c bwb_tbl.c bwbasic.c bwd_fun.c bwx_tty.c bwb_cnd.c bwb_exp.c bwb_inp.c bwb_prn.c bwb_str.c bwb_var.c bwd_cmd.c

.PHONY: all clean install list

all: $(deps)
	$(CC) -o $(name) $(dotc) $(CFlags)

clean:
	rm -f $(name)

install:
	mv $(name) $(bindir)

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
