#!/usr/bin/env python

import openpyxl
import sys
import getopt
import os.path
import magic
from xlrd import open_workbook, XLRDError

def process_xlsx(filename):
    print "processing %s" % filename
    wb = openpyxl.load_workbook(filename)

    for sheet in wb.worksheets:
        print sheet['A2'].value +  " in worksheet %s " % sheet.title
    wb.close()



def main(argv):

    if len(argv) == 0:
        print "Usage: " +  sys.argv[0] + " -f|--file <excel file name>.  No arguments given"
        sys.exit(1)

    try:
        opts = getopt.getopt(argv,"f:",["file="])
    except getopt.GetoptError as err:
        print str(err)
        sys.exit(2)
    else:
        for opt,arg in opts:
            if opt == '-h':
                print sys.argv[0] + " -f|--file <excel file name>"
                sys.exit(1)
            elif opt in ( "-f", "--file"):
                filename = arg
                if not os.path.isfile(filename):
                    print sys.argv[0] + " excel file %s NOT found" % filename
                    sys.exit(1)
                else:
                    try:
                        open_workbook(filename)
                    except XLRDError:
                        print sys.argv[0] + " file %s is not an Excel file" % filename
                    else:
                        if magic.from_file(filename) == 'Microsoft Excel 2007+':
                            process_xlsx(filename)
                        else:
                            print "File must be in .xlsx format"
                            sys.exit(10)

if __name__ == '__main__':
    main(sys.argv[1:])
