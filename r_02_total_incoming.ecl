IMPORT $;

file := $.Processed_Bitcoin.file;

total_incoming := RECORD
    address := file.out_addr;
    total_amount := SUM(GROUP, file.out_val);
END;

total_incoming_table := TABLE(file, total_incoming, file.out_addr);
OUTPUT(total_incoming_table,named('total_incoming'));
