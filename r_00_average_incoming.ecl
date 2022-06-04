IMPORT $;

file := $.Processed_Bitcoin.file;

average_incoming := RECORD
    address := file.out_addr;
    average_amount := AVE(GROUP, file.out_val);
END;

average_incoming_table := TABLE(file, average_incoming, file.out_addr);
OUTPUT(average_incoming_table,named('average_incoming'));
