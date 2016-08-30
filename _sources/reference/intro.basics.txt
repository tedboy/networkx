NetworkX Basics
---------------

.. contents:: `Contents`
   :depth: 2
   :local:
   
After starting Python, import the networkx module with (the recommended way)

>>> import networkx as nx

To save repetition, in the documentation we assume that 
NetworkX has been imported this way.

If importing networkx fails, it means that Python cannot find the installed
module. Check your installation and your PYTHONPATH.

The following basic graph types are provided as Python classes:

:class:`Graph`
   This class implements an undirected graph. It ignores
   multiple edges between two nodes.  It does allow self-loop
   edges between a node and itself.

:class:`DiGraph`
   Directed graphs, that is, graphs with directed edges.
   Operations common to directed graphs, 
   (a subclass of Graph).

:class:`MultiGraph`
   A flexible graph class that allows multiple undirected edges between 
   pairs of nodes.  The additional flexibility leads to some degradation 
   in performance, though usually not significant.

:class:`MultiDiGraph`
   A directed version of a MultiGraph.  

Empty graph-like objects are created with

>>> G=nx.Graph()
>>> G=nx.DiGraph()
>>> G=nx.MultiGraph()
>>> G=nx.MultiDiGraph()

All graph classes allow any :term:`hashable` object as a node.   Hashable
objects include strings, tuples, integers, and more.
Arbitrary edge attributes such as weights and labels 
can be associated with an edge.  


The graph internal data structures are based on an
adjacency list representation and implemented using
Python :term:`dictionary` datastructures.
The graph adjaceny structure is 
implemented as a Python dictionary of
dictionaries; the outer dictionary is keyed by nodes to values that are
themselves dictionaries keyed by neighboring node to the
edge attributes associated with that edge.  This "dict-of-dicts" structure
allows fast addition, deletion, and lookup of nodes and neighbors in 
large graphs.  The underlying datastructure is accessed directly 
by methods (the programming interface "API") in the class definitions.  
All functions, on the other hand, manipulate graph-like objects 
solely via those API methods and not by acting directly on the datastructure. 
This design allows for possible replacement of the 'dicts-of-dicts'-based 
datastructure with an alternative datastructure that implements the
same methods.


Graphs
=======
The first choice to be made when using NetworkX is what type of graph
object to use.  A graph (network) is a collection of nodes together
with a collection of edges that are pairs of nodes.  Attributes are
often associated with nodes and/or edges.  NetworkX graph objects come in
different flavors depending on two main properties of the network:

 - Directed: Are the edges **directed**?  Does the order of the edge
   pairs (u,v) matter?  A directed graph is specified by the "Di"
   prefix in the class name, e.g. DiGraph().  We make this distinction
   because many classical graph properties are defined differently for
   directed graphs.

 - Multi-edges: Are multiple edges allowed between each pair of nodes?
   As you might imagine, multiple edges requires a different data
   structure, though tricky users could design edge data objects to
   support this functionality.  We provide a standard data structure
   and interface for this type of graph using the prefix "Multi",
   e.g. MultiGraph().

The basic graph classes are named:  
:doc:`Graph </reference/classes.graph>`, 
:doc:`DiGraph</reference/classes.digraph>`, 
:doc:`MultiGraph </reference/classes.multigraph>`, and 
:doc:`MultiDiGraph </reference/classes.multidigraph>`