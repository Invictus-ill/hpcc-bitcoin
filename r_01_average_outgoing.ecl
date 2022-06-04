IMPORT $;

file := $.Processed_Bitcoin.file;

average_outgoing := RECORD
    address := file.in_addr;
    average_amount := AVE(GROUP, file.in_val);
END;

average_outgoing_table := TABLE(file, average_outgoing, file.in_addr);
OUTPUT(average_outgoing_table,named('average_outgoing'));
