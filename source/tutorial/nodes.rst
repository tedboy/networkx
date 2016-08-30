Nodes
-----

The graph G can be grown in several ways.
NetworkX includes many graph generator functions
and facilities to read and write graphs in many formats.
To get started though we'll look at simple manipulations.
You can add one node at a time,

>>> G.add_node(1)

add a list of nodes,

>>> G.add_nodes_from([2,3])

or add any :term:`nbunch` of nodes.
An *nbunch* is any iterable container
of nodes that is not itself a node
in the graph. (e.g. a list, set, graph, file, etc..)

>>> H=nx.path_graph(10)
>>> G.add_nodes_from(H)

Note that G now contains the nodes of H as nodes of G.
In contrast, you could use the graph H as a node in G.

>>> G.add_node(H)

The graph G now contains H as a node.  This flexibility
is very powerful as it allows graphs of graphs, graphs of
files, graphs of functions and much more.  It is worth
thinking about how to structure your application so that
the nodes are useful entities.  Of course you can always
use a unique identifier in G and have a separate dictionary
keyed by identifier to the node information if you prefer.
(Note: You should not change the node object if the hash
depends on its contents.)