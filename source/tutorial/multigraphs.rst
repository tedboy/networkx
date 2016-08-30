Multigraphs
-----------

NetworkX provides classes for graphs which allow multiple edges
between any pair of nodes.  The :class:`MultiGraph` and
:class:`MultiDiGraph`
classes allow you to add the same edge twice, possibly with different
edge data.  This can be powerful for some applications, but many
algorithms are not well defined on such graphs.  Shortest path is one
example.  Where results are well defined,
e.g. :meth:`MultiGraph.degree` we provide the function.  Otherwise you
should convert to a standard graph in a way that makes the measurement
well defined.

>>> MG=nx.MultiGraph()
>>> MG.add_weighted_edges_from([(1,2,.5), (1,2,.75), (2,3,.5)])
>>> MG.degree(weight='weight')
{1: 1.25, 2: 1.75, 3: 0.5}
>>> GG=nx.Graph()
>>> for n,nbrs in MG.adjacency_iter():
...    for nbr,edict in nbrs.items():
...        minvalue=min([d['weight'] for d in edict.values()])
...        GG.add_edge(n,nbr, weight = minvalue)
...
>>> nx.shortest_path(GG,1,3)
[1, 2, 3]