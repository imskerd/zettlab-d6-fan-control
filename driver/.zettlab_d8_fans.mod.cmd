savedcmd_zettlab_d8_fans.mod := printf '%s\n'   zettlab_d8_fans.o | awk '!x[$$0]++ { print("./"$$0) }' > zettlab_d8_fans.mod
