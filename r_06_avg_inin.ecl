IMPORT $;

file := $.Processed_Bitcoin.file;


avg_inin := RECORD
    address := file.in_addr;
    neighbour_out := file(file.in_addr = address);
    in_neighbour_out := file(file.out_addr IN neighbour_out);
    inin_neighbour_out := file(file.out_addr IN in_neighbour_out);
    inin_neighbour_out_count := COUNT(inin_neighbour_out);

avg_inin_table := TABLE(file, avg_inin, file.in_addr);
OUTPUT(avg_inin_table, named('avg_inin'));