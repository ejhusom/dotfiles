#!/usr/bin/env python3
# ============================================================================
# File:     plottest.py
# Author:   Erik Johannes Husom
# Created:  2020-09-16
# ----------------------------------------------------------------------------
# Description:
# Test of plotting.
# ============================================================================
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0,99,100)
y = np.sin(x)

plt.plot(x, y)
plt.show()



