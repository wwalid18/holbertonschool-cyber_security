#!/bin/bash
echo -e "$(lsb_release -i | cut -f2)"
