Directed graphs
---------------

The :class:`DiGraph` class provides additional methods specific to directed
edges, e.g.
:meth:`DiGraph.out_edges`,
:meth:`DiGraph.in_degree`,
:meth:`DiGraph.predecessors`,
:meth:`DiGraph.successors` etc.
To allow algorithms to work with both classes easily, the directed
versions of neighbors() and degree() are equivalent to successors()
and the sum of in_degree() and out_degree() respectively even though
that may feel inconsistent at times.

>>> DG=nx.DiGraph()
>>> DG.add_weighted_edges_from([(1,2,0.5), (3,1,0.75)])
>>> DG.out_degree(1,weight='weight')
0.5
>>> DG.degree(1,weight='weight')
1.25
>>> DG.successors(1)
[2]
>>> DG.neighbors(1)
[2]

Some algorithms work only for directed graphs and others are not well
defined for directed graphs.  Indeed the tendency to lump directed
and undirected graphs together is dangerous.  If you want to treat
a directed graph as undirected for some measurement you should probably
convert it using :meth:`Graph.to_undirected` or with

>>> H = nx.Graph(G) # convert G to undirected graph