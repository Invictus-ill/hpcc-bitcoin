
Layout := RECORD
    STRING tx_hash;
    STRING in_addr;
    STRING out_addr;
    INTEGER out_val;
    INTEGER unix_time;
    STRING timestamp;
END;

File := DATASET('~thor::unix_time__p3555684253', Layout, flat);

group_data := GROUP(File, in_addr);
sorted_data := SORT(group_data, unix_time);

OUTPUT(sorted_data);
