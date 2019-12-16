#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May  2 20:32:17 2019

@author: maggiewesterland
"""

### import csv ###
import pandas as pd
from scipy.stats.stats import pearsonr
import matplotlib.pyplot as plt

survey = pd.read_csv("survey_with_exclusions.csv")

### get sums and averages ###
survey['NOMO_sum'] = survey.iloc[:, 16:36].sum(axis=1)

survey['SSS_sum'] = survey.iloc[:, 41:81].sum(axis=1)

survey['reliance_sum'] = survey.iloc[:, 81:94].sum(axis=1)

survey['ADHD_sum'] = survey.iloc[:, 120:138].sum(axis=1)

survey['MAAS_avg'] = survey.iloc[:, 1:16].mean(axis=1)

### another way to name the variables ###
#MAAS_avg = survey['MAAS_avg']
#reliance_sum = survey['reliance_sum']
#NOMO_sum = survey['NOMO_sum']


survey['r_MAASvReliance'], survey['p_MAASvReliance'] = pearsonr(survey['MAAS_avg'], survey['reliance_sum'])

### plots baby plots ###
#matplotlib.pyplot.scatter(survey['reliance_sum'], survey['MAAS_avg'], color = 'black')

plt.scatter(survey['reliance_sum'], survey['MAAS_avg'], color = 'black', alpha=1)
plt.title('Reliance v MAAS')
plt.xlabel('Reliance')
plt.ylabel('MAAS')
plt.show()
