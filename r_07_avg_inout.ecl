IMPORT $;

file := $.Processed_Bitcoin.file;


avg_inout := RECORD
    address := file.in_addr;
    neighbour_out := file(file.in_addr = address);
    out_neighbour_out := file(file.in_addr IN neighbour_out);
    inout_neighbour_out := file(file.out_addr IN out_neighbour_out);
    inout_neighbour_out_count := COUNT(inout_neighbour_out);

avg_inout_table := TABLE(file, avg_inout, file.in_addr);
OUTPUT(avg_inout_table, named('avg_inout'));