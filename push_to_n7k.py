#!/usr/bin/env python3

import sys
import json
import requests
import warnings
import getopt
import os.path
import getpass

warnings.filterwarnings("ignore")

def load_commands(file):
	with open(file) as n7k_commands:
    		cmd_list = n7k_commands.read().splitlines()
	cmd_list = " ; ".join(map(str,cmd_list))
	return cmd_list

def send_to_n7k_api(ip,commands,username,password):
   
    content_type = "json"
    HTTPS_SERVER_PORT = "8080"
    requests.packages.urllib3.disable_warnings()
    
    if commands.endswith(" ; "):
        commands = commands[:-3]
        
    payload = {
        "ins_api": {
            "version": "1.2",
            "type": "cli_conf",
            "chunk": "0",               # do not chunk results
            "sid": "1",
            "input": commands,
            "output_format": "json"
        }
    }
    
    headers={'content-type':'application/%s' % content_type}
    response = requests.post("https://%s:%s/ins" % (ip, HTTPS_SERVER_PORT),
                             auth=(username, password),
                             headers=headers,
                             data=json.dumps(payload),
                             verify=False,                      # disable SSH certificate verification
                             timeout=10)
    
    if response.status_code == 200:
    	allcmds = commands.split(" ; ")
    	# verify result 
    	data = response.json()
    	if isinstance(data['ins_api']['outputs']['output'],dict):
    			if int(data['ins_api']['outputs']['output']['code']) != 200:
    				data['ins_api']['outputs']['output']['msg'] = data['ins_api']['outputs']['output']['msg'].rstrip()
    				print ("ERROR: %s, %s.  Command is: %s" % ('msg', data['ins_api']['outputs']['output']['msg'], commands))	
    			else:
    				if 'body' in data['ins_api']['outputs']['output'] and len(data['ins_api']['outputs']['output']['body']) > 0:
                                	print (data['ins_api']['outputs']['output']['body'])	
    	else:	
    		for d in data['ins_api']['outputs']['output']:
    			for k in d.keys():
    				if int(d['code']) != 200:
    					cmd_number =  data['ins_api']['outputs']['output'].index(d)
    					if k != 'code': 
    						d[k] = d[k].rstrip()
    						print ("ERROR: %s, %s.  Command is: %s" % (k, d[k], allcmds[cmd_number]))
    			if 'body' in d and len(d['body']) > 0:
    					print (d['body'])
               	             
    else:
    	msg = "call to %s failed, status code %d (%s).  Command is %s." % (ip,
                                                          response.status_code,
                                                          response.content.decode("utf-8"),
                                                          commands
                                                          )
    	print(msg)


def usage():
    print ("Usage: " +  sys.argv[0] + " -f|--file <excel file name> -c|--config <credentials file>")
    print ("")
    print ("-f|--file:    Pass input file to use for configuration")
    sys.exit(1)
    

def main(argv):
    errfound = 0
    filename=""
    f_ip = ""
    f_un=""
    f_pw=""

    if len(argv) == 0:
        usage()

    try:
        opts,args = getopt.getopt(argv,"f:h",["file=","help"])
    except getopt.GetoptError as err:
        print (str(err))
        sys.exit(2)
    else:
    	for opt,arg in opts:
    		if opt in ("-h","--help"):
    			usage()
    			sys.exit(9)
    		if opt in ("-f","--file"):
                	filename = arg
                	if not os.path.isfile(filename):
                    		print (sys.argv[0] + " input file %s NOT found" % filename)
                    		sys.exit(1)
    
    if len(filename) == 0:
        print ("Missing -f|--file option")
        sys.exit(9)
    
    username = input("\n\nEnter N7K username and press enter: \n\n")
    password = getpass.getpass("\n\nEnter N7K password and press enter: \n\n")
    n7k = input("\n\nEnter N7K IP and press enter: \n\n")
   
    commands = load_commands(filename)       
    send_to_n7k_api(n7k,commands,username,password)

if __name__ == '__main__':
	main(sys.argv[1:])
