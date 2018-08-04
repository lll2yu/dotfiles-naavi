#!/usr/bin/bash

##
# Purpose: toggle focus with mouse. Needs to be disabled for wonky java stuff
################

toggle=$(bspc config focus_follows_pointer | \
         awk -vtoggle="true" \
        '{ if ($1 == "true") \
        toggle="false"; \
        print toggle}')

bspc config focus_follows_pointer $toggle

