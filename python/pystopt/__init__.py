"""
pystopt – Python bindings for StOpt (C++ / pybind11)
Loads the native C++ extension and exposes its submodules.
"""

# Load the compiled C++ module (pystopt.so)
from . import pystopt as _core

# Re-export all symbols from the extension module
from .pystopt import *

# Explicitly import C++ submodules created via pybind11.def_submodule()
import importlib

for _sub in ["grids", "cdf", "tree", "regression", "geners", "glob"]:
    try:
        importlib.import_module(f"pystopt.{_sub}")
    except Exception:
        passfrom .pystopt import *   # charge l’extension C++
import importlib

