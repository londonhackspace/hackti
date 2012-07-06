#!/usr/bin/env python
from lxml.html.soupparser import fromstring
from lxml.etree import tostring
import requests
import re

response = requests.get("http://192.168.2.1/doc/online.sht", auth=('',''))

# Hideously broken doctype:
txt = re.sub(r'<!DOCTYPE "-//W3C//DTD HTML 4.0 Transitional//EN" PUBLIC HTML>', '', response.text)

doc = fromstring(txt)
body = doc.find('html').find('body')
tables = body.xpath('//table[@class="adsl"]//table')

atm_table = tables[1]
adsl_table = tables[2]

_, tx_cells, rx_cells, tx_crc, rx_crc = \
        [cell.find('font').text for cell in atm_table.findall('tr')[1].findall('td')]

_, mode, state, up_speed, down_speed, snr_margin, loop_att =\
        [cell.find('font').text for cell in adsl_table.findall('tr')[2].findall('td')]

print "tx_cells:%s rx_cells:%s tx_crc:%s rx_crc:%s " \
        "up_speed:%s down_speed:%s snr_margin:%s loop_att:%s" % \
        (tx_cells, rx_cells, tx_crc, rx_crc, up_speed, down_speed,
                snr_margin, loop_att)
