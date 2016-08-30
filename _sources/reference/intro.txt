Introduction
~~~~~~~~~~~~
.. currentmodule:: networkx

.. only:: html

   NetworkX provides data structures for graphs (or networks)
   along with graph algorithms, generators, and drawing tools.


The structure of NetworkX can be seen by the organization of its source code.
The package provides classes for graph objects, generators to create standard
graphs, IO routines for reading in existing datasets, algorithms to analyse
the resulting networks and some basic drawing tools.

Most of the NetworkX API is provided by functions which take a graph object
as an argument.  Methods of the graph object are limited to basic manipulation
and reporting.  This provides modularity of code and documentation. 
It also makes it easier for newcomers to learn about the package in stages.  
The source code for each module is meant to be easy to read and reading 
this Python code is actually a good way to learn more about network algorithms, 
but we have put a lot of effort into making the documentation sufficient and friendly. 
If you have suggestions or questions please contact us by joining the 
`NetworkX Google group <http://groups.google.com/group/networkx-discuss>`_.

Classes are named using CamelCase (capital letters at the start of each word).
functions, methods and variable names are lower_case_underscore (lowercase with
an underscore representing a space between words).

.. toctree::
   :maxdepth: 2
   :numbered:
   :caption: Table of Contents

   intro.basics.rst
   intro.nodes_and_edges.rst



