Accessing edges
---------------

In addition to the methods
:meth:`Graph.nodes`,
:meth:`Graph.edges`, and
:meth:`Graph.neighbors`,
iterator versions (e.g. :meth:`Graph.edges_iter`) can save you from
creating large lists when you are just going to iterate
through them anyway.

Fast direct access to the graph data structure is also possible
using subscript notation.

.. Warning::
   Do not change the returned dict--it is part of
   the graph data structure and direct manipulation may leave the
   graph in an inconsistent state.

>>> G[1]  # Warning: do not change the resulting dict
{2: {}}
>>> G[1][2]
{}

You can safely set the attributes of an edge using subscript notation
if the edge already exists.

>>> G.add_edge(1,3)
>>> G[1][3]['color']='blue'

Fast examination of all edges is achieved using adjacency iterators.
Note that for undirected graphs this actually looks at each edge twice.

>>> FG=nx.Graph()
>>> FG.add_weighted_edges_from([(1,2,0.125),(1,3,0.75),(2,4,1.2),(3,4,0.375)])
>>> for n,nbrs in FG.adjacency_iter():
...    for nbr,eattr in nbrs.items():
...        data=eattr['weight']
...        if data<0.5: print('(%d, %d, %.3f)' % (n,nbr,data))
(1, 2, 0.125)
(2, 1, 0.125)
(3, 4, 0.375)
(4, 3, 0.375)

Convenient access to all edges is achieved with the edges method.

>>> for (u,v,d) in FG.edges(data='weight'):
...     if d<0.5: print('(%d, %d, %.3f)'%(n,nbr,d))
(1, 2, 0.125)
(3, 4, 0.375)