def read_grayscale(path = '.', file = 'Kanna.jpg'):
import os
from scipy import misc
filepath = os.path.join(path, file)
return misc.imread(filepath, mode = 'L')
kanna = read_grayscale()

