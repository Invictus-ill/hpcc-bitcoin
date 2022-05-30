//tx_hash,in_index,in_hash,out_index,out_addr,out_val,timestamp
EXPORT File_Bitcoin := MODULE
EXPORT Layout := RECORD
    STRING tx_hash;
    INTEGER in_index;
    STRING in_hash;
    INTEGER out_index;
    STRING out_addr;
    INTEGER out_val;
    STRING timestamp;
END;
EXPORT File := DATASET('~bitcoin::bitcoin200kblocks.csv', Layout, CSV);
END;
