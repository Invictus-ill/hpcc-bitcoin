IMPORT $;

file := $.Processed_Bitcoin.file;

total_outgoing := RECORD
    address := file.in_addr;
    total_amount := SUM(GROUP, file.in_val);
END;

total_outgoing_table := TABLE(file, total_outgoing, file.in_addr);
OUTPUT(total_outgoing_table,named('total_outgoing'));
