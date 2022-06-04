IMPORT $;

// average_incoming    := $.r_00_average_incoming.File;
// average_outgoing    := $.r_01_average_outgoing.File;
// total_incoming      := $.r_02_total_incoming.File;
// total_outgoing      := $.r_03_total_outgoing.File;

// final_table := JOIN(average_incoming, average_outgoing, total_incoming, total_outgoing,
//                 average_incoming.address = average_outgoing.address AND
//                 average_outgoing.address = total_incoming.address AND
//                 total_incoming.address = total_outgoing.address,
//                 doJoin(average_incoming, average_outgoing, total_incoming, total_outgoing));

// OUTPUT(final_table);


file := $.Processed_Bitcoin.file;

incoming_count := RECORD
    address := file.out_addr;
    in_count := COUNT(GROUP);
END;

outgoing_count := RECORD
    address := file.in_addr;
    out_count := COUNT(GROUP);
END;

average_incoming := RECORD
    address := file.out_addr;
    average_amount_in := AVE(GROUP, file.out_val);
END;

average_outgoing := RECORD
    address := file.in_addr;
    average_amount_out := AVE(GROUP, file.in_val);
END;

total_incoming := RECORD
    address := file.out_addr;
    total_amount_in := SUM(GROUP, file.out_val);
END;

total_outgoing := RECORD
    address := file.in_addr;
    total_amount_out := SUM(GROUP, file.in_val);
END;

stddev_incoming := RECORD
    address := file.out_addr;
    stddev_amount_in := SQRT(VARIANCE(GROUP, file.out_val));
END;

stddev_outgoing := RECORD
    address := file.in_addr;
    stddev_amount_out := SQRT(VARIANCE(GROUP, file.in_val));
END;

incoming_count_table := TABLE(file, incoming_count, file.out_addr);

outgoing_count_table := TABLE(file, outgoing_count, file.in_addr);

average_incoming_table := TABLE(file, average_incoming, file.out_addr);
// OUTPUT(average_incoming_table,named('average_incoming'));

average_outgoing_table := TABLE(file, average_outgoing, file.in_addr);
// OUTPUT(average_outgoing_table,named('average_outgoing'));

total_incoming_table := TABLE(file, total_incoming, file.out_addr);
// OUTPUT(total_incoming_table,named('total_incoming'));

total_outgoing_table := TABLE(file, total_outgoing, file.in_addr);
// OUTPUT(total_outgoing_table,named('total_outgoing'));

stddev_incoming_table := TABLE(file, stddev_incoming, file.out_addr);
// OUTPUT(stddev_incoming_table,named('stddev_incoming'));

stddev_outgoing_table := TABLE(file, stddev_outgoing, file.in_addr);
// OUTPUT(stddev_outgoing_table,named('stddev_outgoing'));

res1 := JOIN(incoming_count_table  , outgoing_count_table  , LEFT.address = RIGHT.address, FULL OUTER);
res2 := JOIN(res1                  , average_incoming_table, LEFT.address = RIGHT.address, FULL OUTER);
res3 := JOIN(res2                  , average_outgoing_table, LEFT.address = RIGHT.address, FULL OUTER);
res4 := JOIN(res3                  , total_incoming_table  , LEFT.address = RIGHT.address, FULL OUTER);
res5 := JOIN(res4                  , total_outgoing_table  , LEFT.address = RIGHT.address, FULL OUTER);
res6 := JOIN(res5                  , stddev_incoming_table , LEFT.address = RIGHT.address, FULL OUTER);
res7 := JOIN(res6                  , stddev_outgoing_table , LEFT.address = RIGHT.address, FULL OUTER);

// OUTPUT(res5);
OUTPUT(res7,,'~thor::r_stats.csv');

