#!/usr/bin/env bash


#usage bash sphinx-eval/test3in1dic_gt100.sh lm_dmp_dir dic_dir acoustic_dir test_dir test_corpus wav_dir hyp_dir log_dir

bash sphinx-eval/test.sh dmps dicts acoustic test/kacst kacst500 hyp logs


bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/kacst kacst500 \
test/kacst/kacst500_wav hyp logs


<<<<<<< HEAD
bash sphinx-eval/test3in1dic_gt100.sh dmps dicts acoustic test/N7_020723_RMC N7_020723_RMC_AR \
/home/msaad/speechdata/elra/sphinx_files/speech_test_wav hyp logs
=======
for h in test/kacst/hyp/*gt100*
do
echo ${h}
perl /usr/local/lib/sphinxtrain/scripts/decode/word_align.pl \
test/kacst/kacst500_test.transcription ${h} | grep 'TOTAL Percent'
done




>>>>>>> 18daea6fe076b618bd3974b803bb9be6b4cf1eb5

