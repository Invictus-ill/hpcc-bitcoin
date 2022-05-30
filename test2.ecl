IMPORT $;


BitcoinTxRaw := $.File_Bitcoin.File;
Deduped_Data := DEDUP(BitcoinTxRaw, WHOLE RECORD, ALL);


OUTPUT(count(Deduped_Data));
//OUTPUT(count(Datas));
OUTPUT(count(BitcoinTxRaw));
