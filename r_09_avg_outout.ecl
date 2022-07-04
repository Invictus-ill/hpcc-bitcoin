IMPORT $;

file := $.Processed_Bitcoin.file;


avg_outout := RECORD
    address := file.in_addr;
    neighbour_out := file(file.in_addr = address);
    out_neighbour_out := file(file.in_addr IN neighbour_out);
    outout_neighbour_out := file(file.in_addr IN in_neighbour_out);
    outout_neighbour_out_count := COUNT(outout_neighbour_out);
END;
avg_outout_table := TABLE(file, avg_outout, file.in_addr);
OUTPUT(avg_outout_table, named('avg_out'));