
Layout := RECORD
    STRING tx_hash;
    STRING in_addr;
    STRING out_addr;
    INTEGER out_val;
    INTEGER unix_time;
    STRING timestamp;
    INTEGER RTI;
END;

File := DATASET('~thor::unix_time__p3556388543', Layout, flat);

// sorted_data_addr := SORT(File , File.in_addr);
// output(sorted_data_addr);

group_data := GROUP(File, in_addr, ALL);

sort_data_time := SORT(group_data, group_data.unix_time);

// sorted_data := SORT(File, unix_time);
// grouped_data := GROUP(sorted_data, in_addr);
init_addr := '111114KdW76em73CvERMrjDj9CU4eAEz2';

out_data := ITERATE(sort_data_time,
    TRANSFORM(Layout,
        SELF.rti := IF(RIGHT.in_addr = LEFT.in_addr OR RIGHT.in_addr = init_addr,IF(RIGHT.tx_hash != LEFT.tx_hash, RIGHT.unix_time - LEFT.unix_time, 0),0);
        SELF := RIGHT;
    )
);

output(out_data);


