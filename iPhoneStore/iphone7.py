# -*- coding: UTF-8 -*-

import urllib2
import re
import json
import sys

def get_html(url):
		r=urllib2.Request(url)
		req = urllib2.urlopen(r)
		html = req.read()
		return html

html=get_html("https://reserve.cdn-apple.com/HK/en_HK/reserve/iPhone/availability.json")
data=json.loads(html)

def get_info(store_name):
		if store_name=="R499":
			name="CR"
		if store_name=="R610":
			name="NTP"
		if store_name=="R485":
			name="FW"
		if store_name=="R409":
			name="CB"
		if store_name=="R428":
			name="IFC"
        #if store_name=="R673":
        #    name="APM"
		with open('/tmp/data.out','a')as f:
			#f.write(store_name+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_256_r"+":"+data[store_name]["MN8V2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_32_b"+":"+data[store_name]["MN8G2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_128_s"+":"+data[store_name]["MN492ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_32_g"+":"+data[store_name]["MNQK2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_128_g"+":"+data[store_name]["MN8N2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_128_jb"+":"+data[store_name]["MN8Q2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_256_jb"+":"+data[store_name]["MN4L2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_32_r"+":"+data[store_name]["MN8K2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_256_s"+":"+data[store_name]["MN4F2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_256_g"+":"+data[store_name]["MN8U2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_256_b"+":"+data[store_name]["MN8R2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_32_s"+":"+data[store_name]["MNQJ2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_32_s"+":"+data[store_name]["MN8H2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_128_r"+":"+data[store_name]["MN4C2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_128_jb"+":"+data[store_name]["MN4D2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_256_g"+":"+data[store_name]["MN4J2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_128_g"+":"+data[store_name]["MN4A2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_128_b"+":"+data[store_name]["MN8L2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_256_s"+":"+data[store_name]["MN8T2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_32_b"+":"+data[store_name]["MNQH2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_256_jb"+":"+data[store_name]["MN8W2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_256_b"+":"+data[store_name]["MN4E2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_32_g"+":"+data[store_name]["MN8J2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_128_s"+":"+data[store_name]["MN8M2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_256_r"+":"+data[store_name]["MN4K2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_128_b"+":"+data[store_name]["MN482ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7p_32_r"+":"+data[store_name]["MNQL2ZP/A"]+"\n".decode('utf-8','ignore'))
			f.write(name+"_7_128_r"+":"+data[store_name]["MN8P2ZP/A"]+"\n".decode('utf-8','ignore'))

with open('/tmp/data.out','w')as f:
	if len(data)==0:
		f.write("emptyall")
		sys.exit(0)
	else:
		f.write("")
get_info("R499") #"Canton Road"
get_info("R610") #"New Town Plaza"
get_info("R485") #"Festival Walk"
get_info("R409") #"Causeway Bay"
get_info("R428") #"ifc mall"
#get_info("R673") #"apm Hong Kong"
