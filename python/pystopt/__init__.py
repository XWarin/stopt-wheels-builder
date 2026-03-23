from .pystopt import *   # charge l’extension C++
import importlib

# expose les sous modules C++ comme modules Python
grids = importlib.import_module("pystopt.grids")
tree = importlib.import_module("pystopt.tree")
cdf = importlib.import_module("pystopt.cdf")
regression = importlib.import_module("pystopt.regression")
geners = importlib.import_module("pystopt.geners")
glob = importlib.import_module("pystopt.glob")
