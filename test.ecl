IMPORT $;

Datas := $.Processed_Bitcoin.File;
BitcoinTxRaw := $.File_Bitcoin.File;
Deduped_Data := DEDUP(Datas, WHOLE RECORD):PERSIST('bitcoin::dedup200kin');

OUTPUT(count(Deduped_Data));
//OUTPUT(count(Datas));
OUTPUT(count(BitcoinTxRaw));
