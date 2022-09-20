# Detect Group Bias in COVID-19 Anti-vax Detection Models (2022 Spring Fairness in Machine Learning)

* Team members: Sheng-Tai Huang
* Project paper: [link](https://github.com/shengtaihuang/fml_project/blob/main/shengtai-huang_final_report.pdf)


{Below is just some basics information you should include in your project README}

## Description
{A summary of what the project is and does, the technology it employs, and the purpose behind the project.}
{Provide a summary for the major directories and files and what they do. You can also provide a table of content here and link to seperate readme files.}

- Pre-trained COVID BERT: [link](https://github.com/digitalepidemiologylab/covid-twitter-bert)
- Labeled ANTivax Data: [link](https://github.com/SakibShahriar95/ANTiVax)

### Folders:
- data/: raw Facebook data of each group
- labeled/: labeled ANTiVax data and my labeled Facebook data
### Files
#### Python
- bertopic.ipynb: Extract embeddings from the fine-tuned COVID-Twitter-BERT and use BERTopic for topic modeling
- covid-bert_finetune.ipynb: Fine-tune the COVID-Twitter-BERT by using ANTiVax data and assess on my collected Facebook data
#### R
- clean_not_group.R: filter out groups that is not aligned to the target keywords, for example, filter out groups with "conservative" but are actually opposing conservative
- generate_labeled_data.R: Data pre-processing for hydrating data
- plot_bertopic.R: Scatter plots of BERTopic
#### Results
bertopic_result.csv: Embeddings and topic modeling results from the fine-tuned COVID-Twitter-BERT

## Prerequisites
{If your project requires any applications or special configurations, you will place them in this section. List any requirements, packages, configurations, etc. Add in any special requirements for file system or database.}

Packages:

Python                                                                          | R 
--------------------------------------------------------------------------------|-------------------------------------
hdbscan, json, nltk, numpy, pandas, re, sklearn, tensorflow, transformers, umap | data.table, dplyr, ggplot2, jsonlite

## Inspiration
- The code of fine-tuning COVID-Twitter-BERT is based on the example provided by the authors of COVID-Twitter-BERT[link]
(https://colab.research.google.com/github/digitalepidemiologylab/covid-twitter-bert/blob/master/CT_BERT_Huggingface_(GPU_training).ipynb).
- The code of building BERTopic is based on the example provided by the authors of BERTopic [link](https://towardsdatascience.com/interactive-topic-modeling-with-bertopic-1ea55e7d73d8).

## Authors
Sheng-Tai Huang: shengtai.huang@pitt.edu

## License
{Provide the license information, e.g.,}
[MIT](https://choosealicense.com/licenses/mit/)
