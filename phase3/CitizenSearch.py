# -*- coding: utf-8 -*-
"""Untitled2.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1H8aU4v_ZTAv457-q8fg9HpFsPnyT2Qyz
"""

from citizen import *

class CitizenSearch:
  def search_by_name(self,first_name,last_name):
    result = Citizen.select().where(
        (Citizen.first_name == first_name) & (Citizen.last_name == last_name)
    )
    return result