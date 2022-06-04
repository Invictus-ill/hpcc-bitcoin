IMPORT $;

BitcoinTxRaw := $.File_Bitcoin.File;


OutputLayout := RECORD
    STRING tx_hash;
    STRING in_addr;
    INTEGER in_val;
    STRING out_addr;
    INTEGER out_val;
    STRING timestamp;
END;

Layout := $.File_Bitcoin.Layout;

OutputLayout JoinThem(Layout L, Layout R) := TRANSFORM
    SELF.in_addr := R.out_addr;
    SELF.in_val := R.out_val;
    SELF.tx_hash := L.tx_hash;
    SELF.out_addr := L.out_addr;
    SELF.out_val := L.out_val;
    SELF.timestamp := L.timestamp;
END;

//DedupTxRaw := DEDUP(BitcoinTxRaw, tx_hash,out_index);

Temp := JOIN(BitcoinTxRaw, BitcoinTxRaw,
                    LEFT.in_hash = RIGHT.tx_hash 
                    AND LEFT.in_index = RIGHT.out_index
                    ,
                    JoinThem(LEFT, RIGHT));
                    // PERSIST('bitcoin::blk200kin');

Export ParsedData := DEDUP(Temp, WHOLE RECORD, ALL):
                     PERSIST('bitcoin::blk200kin');


