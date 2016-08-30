Edges
-----

G can also be grown by adding one edge at a time,

>>> G.add_edge(1,2)
>>> e=(2,3)
>>> G.add_edge(*e) # unpack edge tuple*

by adding a list of edges,

>>> G.add_edges_from([(1,2),(1,3)])

or by adding any :term:`ebunch` of edges.
An *ebunch* is any iterable container
of edge-tuples.  An edge-tuple can be a 2-tuple
of nodes or a 3-tuple with 2 nodes followed by
an edge attribute dictionary, e.g. (2,3,{'weight':3.1415}).
Edge attributes are discussed further below

>>> G.add_edges_from(H.edges())

One can demolish the graph in a similar fashion; using
:meth:`Graph.remove_node`,
:meth:`Graph.remove_nodes_from`,
:meth:`Graph.remove_edge`
and
:meth:`Graph.remove_edges_from`, e.g.

>>> G.remove_node(H)

There are no complaints when adding existing nodes or edges. For example,
after removing all nodes and edges,

>>> G.clear()

we add new nodes/edges and NetworkX quietly ignores any that are
already present.

>>> G.add_edges_from([(1,2),(1,3)])
>>> G.add_node(1)
>>> G.add_edge(1,2)
>>> G.add_node("spam")       # adds node "spam"
>>> G.add_nodes_from("spam") # adds 4 nodes: 's', 'p', 'a', 'm'

At this stage the graph G consists of 8 nodes and 2 edges, as can be seen by:

>>> G.number_of_nodes()
8
>>> G.number_of_edges()
2

We can examine them with

>>> G.nodes()
['a', 1, 2, 3, 'spam', 'm', 'p', 's']
>>> G.edges()
[(1, 2), (1, 3)]
>>> G.neighbors(1)
[2, 3]

Removing nodes or edges has similar syntax to adding:

>>> G.remove_nodes_from("spam")
>>> G.nodes()
[1, 2, 3, 'spam']
>>> G.remove_edge(1,3)

When creating a graph structure by instantiating one of the graph
classes you can specify data in several formats.

>>> H=nx.DiGraph(G)   # create a DiGraph using the connections from G
>>> H.edges()
[(1, 2), (2, 1)]
>>> edgelist=[(0,1),(1,2),(2,3)]
>>> H=nx.Graph(edgelist)