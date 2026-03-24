"""
pystopt – Python bindings for StOpt (patched to expose pybind11 submodules)
"""

# Load the compiled C++ extension
from . import pystopt as _core
from .pystopt import *

# Explicitly import C++ submodules created via pybind11.def_submodule()
import importlib

for _sub in ["grids", "cdf", "tree", "regression", "geners", "glob"]:
    try:
        importlib.import_module(f"pystopt.{_sub}")
    except Exception:
        pass
