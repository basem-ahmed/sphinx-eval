#!/usr/bin/env bash





function get_oov_count {
    test_dir=${1}
    printf "processing %s\n" ${test_dir}
    mkdir -p ${test_dir}/oov_freq
    for oov_file in ${test_dir}/oov/*.oov
    do
        oov_name=$(basename ${oov_file})
        cat ${oov_file} | tr ' ' '\n' | sort | uniq -c | sort -nr > ${test_dir}/oov_freq/${oov_name}.freq
    done
    test_name=$(basename ${test_dir})
    cat ${test_dir}/oov/*.oov | tr ' ' '\n' | sort | uniq -c | sort -nr > ${test_dir}/oov_freq/${test_name}_all_oov.freq
    cat ${test_dir}/oov/*.oov | tr ' ' '\n' | sort | uniq -c | sort -nr | \
    awk '{print $2}' | head -n 500 | tr '\n' ' ' > asr-test/oov_all/${test_name}.oov 
}



# oov count kacst
test_corpus="asr-test/kacst"
get_oov_count ${test_corpus}

# oov count N7_020723_RMC_AR
test_corpus="asr-test/N7_020723_RMC"
get_oov_count ${test_corpus}

# oov count N7_040810_MED_AR
test_corpus="asr-test/N7_040810_MED"
get_oov_count ${test_corpus}

# oov count jsc
test_corpus="asr-test/jsc"
get_oov_count ${test_corpus}


printf "done!\n"