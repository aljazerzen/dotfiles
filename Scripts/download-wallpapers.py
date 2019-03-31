#!/usr/bin/python
import requests
from lxml import html
import re
from io import BytesIO
import os

def parse_categories(xnode):
	r = []
	for child in xnode.getchildren():
		name = re.sub(r"(^.*/)|(-desktop.*$)", '', child.xpath('a/@href')[0])
		subcategory = child.xpath('ul[contains(@class, "level_")]')

		r.append({ 
			"name": name, 
			"children": parse_categories(subcategory[0]) if subcategory else []
		})
	return r		

def print_categories(categories, depth_limit = -1, depth = 0):
	for category in categories:
		print(" " * depth + category["name"])
		if depth_limit < 0 or depth < depth_limit: 
			print_categories(category["children"], depth + 1)

def list_categories():
	page = requests.get('http://wallpaperswide.com/sitemap.html')
	tree = html.fromstring(page.content)
	
	cat = parse_categories(tree.xpath('//div[@class="sitemap"]//*[contains(text(), "Categories")]/ul')[0])
	print_categories(cat, 1)

def download_category(category):
	wallpaper_dir = '/home/aljaz/Pictures/Wallpapers'

	page = requests.get('http://wallpaperswide.com/%s-desktop-wallpapers.html' % category)
	tree = html.fromstring(page.content)

	thumbs = tree.xpath('//ul[@class="wallpapers"]//img[@class="thumb_img"]/@src')

	url_template = "http://wallpaperswide.com/download/%s-wallpaper-1920x1200.jpg"

	regex = re.compile(r"(^.*/thumbs/)|(-t1.*$)")
	image_names = [regex.sub('', thumb) for thumb in thumbs]

	for image_name in image_names:
		file_path = os.path.join(wallpaper_dir, image_name + '.jpg')
		file_path_old = os.path.join(wallpaper_dir, 'old', image_name + '.jpg')
		file_path_new = os.path.join(wallpaper_dir, 'new', image_name + '.jpg')

		if not os.path.isfile(file_path) and not os.path.isfile(file_path_old) and not os.path.isfile(file_path_new):

			r = requests.get(url_template % image_name, stream=True)		
			
			with open(file_path_new, 'wb') as fd:
			    for chunk in r.iter_content(chunk_size=128):
			        fd.write(chunk)


# list_categories()
download_category('beach')