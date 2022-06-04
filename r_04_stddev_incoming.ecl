IMPORT $;

file := $.Processed_Bitcoin.file;

stddev_incoming := RECORD
    address := file.out_addr;
    stddev_amount := SQRT(VARIANCE(GROUP, file.out_val));
END;

stddev_incoming_table := TABLE(file, stddev_incoming, file.out_addr);
OUTPUT(stddev_incoming_table,named('stddev_incoming'));
