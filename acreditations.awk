BEGIN{

	counter_line = 1;
	number_html_lines = 1;
	while ((getline < base_file) > 0) {

		base_acretitation[counter_line] = $0;
		
		if (match($0,"id=\"name\"")) {
			name_line = counter_line + 1;
		}
		
		if (match($0,"id=\"institution\"")) {
			institution_line = counter_line + 1;
		}
		counter_line = counter_line + 1;
		number_html_lines = counter_line;
	}

	print "<!doctype html>"
	print "<html>"
	print "<head>"
	print "<meta charset=\"utf-8\">"
	print "<title>Acreditacion</title>"
	print "</head>"
	print "<body>"

}

{
	split($0, splited_row, ";");
	name = splited_row[1];
	institution = splited_row[2];

	counter_line = 1;
	for (i = 1; i < number_html_lines; i++) {

		if (counter_line == name_line || counter_line == institution_line) {

			if (counter_line == name_line) {
				print name;
			} else {
				print institution;
			}

		} else {

			print base_acretitation[i];

		}

		counter_line = counter_line + 1;

	}
}

END{

	print "</body>"
	print "</html>"

}
