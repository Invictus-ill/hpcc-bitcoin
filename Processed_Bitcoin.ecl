//tx_hash,in_addr,out_addr,out_val,timestamp
EXPORT Processed_Bitcoin := MODULE
EXPORT Layout := RECORD
    STRING tx_hash;
    STRING in_addr;
    INTEGER in_val;
    STRING out_addr;
    INTEGER out_val;
    STRING timestamp;
END;

EXPORT File := DATASET('~thor::bitcoin::blk200kin__p3459004277', Layout, flat);
END;
