#!/usr/bin/env bash
set -e

pretrained_bert=/path/to/bert_model
model_dir=/path/to/model_checkpoint
train_dir=/path/to/train_data
label_list=/path/to/label_dictionary
num_train_epochs=3
num_train_steps=50000

#cd ..

python3 -m bert_ner.bert_train \
--pretrained_bert=$pretrained_bert \
--label_list=$label_list \
--model_dir=$model_dir \
--train_dir=$train_dir \
--num_train_steps=$num_train_steps

test_xml_path=/path/to/test_files
export_xml_path=/path/to/predicted_test_files

python3 -m bert_ner.predict_predict \
--pretrained_bert=$pretrained_bert \
--label_list=$label_list \
--model_dir=$model_dir \
--train_dir=$train_dir \
--xml_path=$test_xml_path \
--export_xml_path=$export_xml_path


python3 -m bert_ner.metrics.evaluate cr $export_xml_path $test_xml_path