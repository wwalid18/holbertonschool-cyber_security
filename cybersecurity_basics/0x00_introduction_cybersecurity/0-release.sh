#!/bin/bash
lsb_release -i | cut -d$'\t' -f2
