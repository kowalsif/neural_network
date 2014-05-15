import sys


def GenerateRom(num_data):
	#first 
	f= open('Neural_ROM.coe', 'w')
	f.write('MEMORY_INITIALIZATION_RADIX=16;\n')
	f.write('MEMORY_INITIALIZATION_VECTOR=\n')
	for i in range(0, num_data):
		f.write('{},\n'.format(hex32bit(base10toN(i, 16))))
	#Print out end signal
	f.write('7fffffff;\n')

def base10toN(num,n):
	"""Change a  to a base-n number.
	Up to base-36 is supported without special notation."""
	num_rep={10:'a',
		11:'b',
		12:'c',
		13:'d',
		14:'e',
		15:'f',
		16:'g',
		17:'h',
		18:'i',
		19:'j',
		20:'k',
		21:'l',
		22:'m',
		23:'n',
		24:'o',
		25:'p',
		26:'q',
		27:'r',
		28:'s',
		29:'t',
		30:'u',
		31:'v',
		32:'w',
		33:'x',
		34:'y',
		35:'z'}
	new_num_string=''
	current= num
	while current!=0:
		remainder=current%n
		if 36>remainder>9:
			remainder_string=num_rep[remainder]
		elif remainder>=36:
			remainder_string='('+str(remainder)+')'
		else:
			remainder_string=str(remainder)
		new_num_string=remainder_string+new_num_string
		current= int(current/n)
	return new_num_string
#Turns a hex number into a 32-bit hex number	
def hex32bit(hexNum):
	return '0'*(8-len(hexNum)) + hexNum

def main():
		num = int(sys.argv[1])
		GenerateRom(num)

if __name__ == "__main__":
	main()