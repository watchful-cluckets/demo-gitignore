mkdir IRRELEVANT_dir
mkdir relevant_dir

max=3
for i in `seq 1 $max`
do
    touch "IRRELEVANT_dir/junk.file$i"
    touch "IRRELEVANT.file$i"
    touch "relevant_dir/junk.file$i"
    touch "relevant.file$i"
done
