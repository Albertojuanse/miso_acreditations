#!/bin/bash
	awk -f acreditations.awk -v base_file="base_acreditation.html" names.txt > acreditations_print.html


