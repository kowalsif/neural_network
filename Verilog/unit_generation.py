#README: This program takes a command line argument of the number of units to generate
#This currently generates the Weight_Reg_Bank and its test fixture

import sys
import random
import math
import Weight_Reg_Bank
import Data_Reg_Bank

def header(module, description):
	names = ['Neural Network', 'FPGA Brain', 'Brain Network', 'Distributed Brain']
	s = """//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: """ + module +  """
// Project Name: """ + names[random.randint(0,len(names)-1)] + """
// Description: """ + description + """
// 
//////////////////////////////////////////////////////////////////////////////////

"""
	return s
	

def main():
	numUnits = int(sys.argv[1])
	random.seed()
	#Weight_Reg_Bank.WeightRegBank(numUnits)
	#Weight_Reg_Bank.WeightRegBankTB(numUnits)
	Data_Reg_Bank.DataRegBank(numUnits)
	Data_Reg_Bank.DataRegBankTB(numUnits)
	

	
	

if __name__ == "__main__":
	main()