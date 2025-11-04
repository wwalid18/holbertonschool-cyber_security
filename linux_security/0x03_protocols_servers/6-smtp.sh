#!/bin/bash
sudo postconf -n | grep -i starttls || echo "STARTTLS not configured"
