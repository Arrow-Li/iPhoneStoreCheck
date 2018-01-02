# -*- coding: UTF-8 -*-

import urllib2
import re
import json
import sys


def get_html(url):
    header = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:55.0) Gecko/20100101 Firefox/55.0'}
    r = urllib2.Request(url, None, header)
    req = urllib2.urlopen(r)
    html = req.read()
    return html


html = get_html(
    "https://reserve-prime.apple.com/CN/zh_CN/reserve/iPhoneX/availability.json")
data = json.loads(html)


def get_info(store_name):
    # 大陆
    if store_name == "R705":
        name = "QB"
    if store_name == "R401":
        name = "HM"
    if store_name == "R581":
        name = "WJ"
    if store_name == "R359":
        name = "NJ"
    if store_name == "R389":
        name = "PD"
    if store_name == "R683":
        name = "HQ"
    if store_name == "R390":
        name = "XG"
# 香港
    if store_name == "R499":
        name = "CR"
    if store_name == "R610":
        name = "NTP"
    if store_name == "R485":
        name = "FW"
    if store_name == "R409":
        name = "CB"
    if store_name == "R428":
        name = "IFC"
    # if store_name=="R673":
    #    name="APM"
    with open('/tmp/data.out', 'a')as f:
        # f.write(store_name+"\n".decode('utf-8','ignore'))
        f.write(name + "_x_64_g" + ":" +
                str(data["stores"][store_name]["MQA52CH/A"]["availability"]["unlocked"]) + "\n".decode('utf-8', 'ignore'))
        f.write(name + "_x_64_s" + ":" +
                str(data["stores"][store_name]["MQA62CH/A"]["availability"]["unlocked"]) + "\n".decode('utf-8', 'ignore'))
        f.write(name + "_x_256_g" + ":" +
                str(data["stores"][store_name]["MQA82CH/A"]["availability"]["unlocked"]) + "\n".decode('utf-8', 'ignore'))
        f.write(name + "_x_256_s" + ":" +
                str(data["stores"][store_name]["MQA92CH/A"]["availability"]["unlocked"]) + "\n".decode('utf-8', 'ignore'))


with open('/tmp/data.out', 'w')as f:
    if len(data) == 0:
        f.write("emptyall")
        sys.exit(0)
    else:
        f.write("")

get_info("R705")  # 上海, 七宝
get_info("R401")  # 上海, 上海环贸 iapm
get_info("R581")  # 上海, 五角场
get_info("R359")  # 上海, 南京东路
get_info("R389")  # 上海, 浦东
get_info("R683")  # 上海, 环球港
get_info("R390")  # 上海, 香港广场

# get_info("R499") #"Canton Road"
# get_info("R610") #"New Town Plaza"
# get_info("R485") #"Festival Walk"
# get_info("R409") #"Causeway Bay"
# get_info("R428") #"ifc mall"
# get_info("R673") #"apm Hong Kong"
