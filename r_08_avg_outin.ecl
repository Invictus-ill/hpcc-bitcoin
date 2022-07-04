IMPORT $;

file := $.Processed_Bitcoin.file;


avg_outin := RECORD
    address := file.in_addr;
    neighbour_out := file(file.in_addr = address);
    in_neighbour_out := file(file.out_addr IN neighbour_out);
    outin_neighbour_out := file(file.in_addr IN in_neighbour_out);
    outin_neighbour_out_count := COUNT(outin_neighbour_out);

avg_outin_table := TABLE(file, avg_outin, file.in_addr);
OUTPUT(avg_outin_table, named('avg_outin'));