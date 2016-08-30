Nodes and Edges
---------------

.. contents:: `Contents`
   :depth: 2
   :local:
   
The next choice you have to make when specifying a graph is what kinds
of nodes and edges to use.  

If the topology of the network is all you
care about then using integers or strings as the nodes makes sense and
you need not worry about edge data.  If you have a data structure
already in place to describe nodes you can simply use that structure
as your nodes provided it is :term:`hashable`.  If it is not hashable you can
use a unique identifier to represent the node and assign the data
as a :term:`node attribute`.

Edges often have data associated with them.  Arbitrary data
can associated with edges as an :term:`edge attribute`.
If the data is numeric and the intent is to represent
a *weighted* graph then use the 'weight' keyword for the attribute.
Some of the graph algorithms, such as
Dijkstra's shortest path algorithm, use this attribute
name to get the weight for each edge.

Other attributes can be assigned to an edge by using keyword/value
pairs when adding edges.  You can use any keyword except 'weight'
to name your attribute and can then easily query the edge
data by that attribute keyword.

Once you've decided how to encode the nodes and edges, and whether you have
an undirected/directed graph with or without multiedges you are ready to build 
your network.

Graph Creation
==============
NetworkX graph objects can be created in one of three ways:

- Graph generators -- standard algorithms to create network topologies.
- Importing data from pre-existing (usually file) sources.
- Adding edges and nodes explicitly.

Explicit addition and removal of nodes/edges is the easiest to describe.
Each graph object supplies methods to manipulate the graph.  For example,

>>> import networkx as nx
>>> G=nx.Graph()
>>> G.add_edge(1,2)  # default edge data=1
>>> G.add_edge(2,3,weight=0.9) # specify edge data

Edge attributes can be anything:

>>> import math
>>> G.add_edge('y','x',function=math.cos) 
>>> G.add_node(math.cos) # any hashable can be a node

You can add many edges at one time:

>>> elist=[('a','b',5.0),('b','c',3.0),('a','c',1.0),('c','d',7.3)]
>>> G.add_weighted_edges_from(elist) 

See the :doc:`/tutorial/index` for more examples.

Some basic graph operations such as union and intersection
are described in the :ref:`Operators module<operators>` documentation.

Graph generators such as binomial_graph and powerlaw_graph are provided in the
:doc:`generators` subpackage.

For importing network data from formats such as GML, GraphML, edge list text files
see the :doc:`readwrite` subpackage.


Graph Reporting
===============
Class methods are used for the basic reporting functions neighbors, edges and degree.
Reporting of lists is often needed only to iterate through that list so we supply
iterator versions of many property reporting methods.  For example edges() and 
nodes() have corresponding methods edges_iter() and nodes_iter().  
Using these methods when you can will save memory and often time as well.

The basic graph relationship of an edge can be obtained in two basic ways.
One can look for neighbors of a node or one can look for edges incident to
a node.  We jokingly refer to people who focus on nodes/neighbors as node-centric
and people who focus on edges as edge-centric.  The designers of NetworkX
tend to be node-centric and view edges as a relationship between nodes.  
You can see this by our avoidance of notation like G[u,v] in favor of G[u][v].
Most data structures for sparse graphs are essentially adjacency lists and so
fit this perspective.  In the end, of course, it doesn't really matter which way
you examine the graph.  G.edges() removes duplicate representations of each edge
while G.neighbors(n) or G[n] is slightly faster but doesn't remove duplicates.

Any properties that are more complicated than edges, neighbors and degree are
provided by functions.  For example nx.triangles(G,n) gives the number of triangles
which include node n as a vertex.  These functions are grouped in the code and 
documentation under the term :ref:`algorithms<algorithms>`.


Algorithms
==========
A number of graph algorithms are provided with NetworkX.
These include shortest path, and breadth first search 
(see :ref:`traversal<traversal>`),
clustering and isomorphism algorithms and others.  There are
many that we have not developed yet too.  If you implement a
graph algorithm that might be useful for others please let 
us know through the 
`NetworkX Google group <http://groups.google.com/group/networkx-discuss>`_
or the Github `Developer Zone <https://github.com/networkx/networkx>`_.

As an example here is code to use Dijkstra's algorithm to 
find the shortest weighted path: 

>>> G=nx.Graph()
>>> e=[('a','b',0.3),('b','c',0.9),('a','c',0.5),('c','d',1.2)]
>>> G.add_weighted_edges_from(e)
>>> print(nx.dijkstra_path(G,'a','d'))
['a', 'c', 'd']

Drawing
=======
While NetworkX is not designed as a network layout tool, we provide
a simple interface to drawing packages and some simple layout algorithms. 
We interface to the excellent Graphviz layout tools like dot and neato
with the (suggested) pygraphviz package or the pydot interface.
Drawing can be done using external programs or the Matplotlib Python
package.  Interactive GUI interfaces are possible though not provided.
The drawing tools are provided in the module :ref:`drawing<drawing>`.

The basic drawing functions essentially place the nodes on a scatterplot
using the positions in a dictionary or computed with a layout function.  The
edges are then lines between those dots.  

>>> G=nx.cubical_graph()
>>> nx.draw(G)   # default spring_layout
>>> nx.draw(G,pos=nx.spectral_layout(G), nodecolor='r',edge_color='b')

See the 
:doc:`examples</examples/index>`
for more ideas.

Data Structure
==============
NetworkX uses a "dictionary of dictionaries of dictionaries" as the
basic network data structure.  This allows fast lookup with reasonable
storage for large sparse networks.  The keys are nodes so G[u] returns
an adjacency dictionary keyed by neighbor to the edge attribute
dictionary.  
The expression G[u][v] returns the edge attribute dictionary itself.  A
dictionary of lists would have also been possible, but not allowed
fast edge detection nor convenient storage of edge data.

Advantages of dict-of-dicts-of-dicts data structure:
  
 - Find edges and remove edges with two dictionary look-ups.
 - Prefer to "lists" because of fast lookup with sparse storage.
 - Prefer to "sets" since data can be attached to edge.
 - G[u][v] returns the edge attribute dictionary.
 - ``n in G`` tests if node ``n`` is in graph G.
 - ``for n in G:`` iterates through the graph.
 - ``for nbr in G[n]:`` iterates through neighbors.

As an example, here is a representation of an undirected graph with the 
edges ('A','B'), ('B','C')

>>> G=nx.Graph()
>>> G.add_edge('A','B')
>>> G.add_edge('B','C')
>>> print(G.adj)
{'A': {'B': {}}, 'C': {'B': {}}, 'B': {'A': {}, 'C': {}}}

The data structure gets morphed slightly for each base graph class.
For DiGraph two dict-of-dicts-of-dicts structures are provided, one 
for successors and one for predecessors.
For MultiGraph/MultiDiGraph we use a dict-of-dicts-of-dicts-of-dicts [#turtles]_
where the third dictionary is keyed by an edge key identifier to the fourth 
dictionary which contains the edge attributes for that edge between
the two nodes.

Graphs use a dictionary of attributes for each edge.
We use a dict-of-dicts-of-dicts data structure with the inner 
dictionary storing "name-value" relationships for that edge.

>>> G=nx.Graph()
>>> G.add_edge(1,2,color='red',weight=0.84,size=300)
>>> print(G[1][2]['size'])
300

.. rubric:: Footnotes

.. [#turtles] "It's dictionaries all the way down."

