IMPORT $;

file := $.Processed_Bitcoin.file;

stddev_outgoing := RECORD
    address := file.in_addr;
    stddev_amount := VARIANCE(GROUP, file.in_val);
END;

stddev_outgoing_table := TABLE(file, stddev_outgoing, file.in_addr);
OUTPUT(stddev_outgoing_table,named('stddev_outgoing'));
