Analyzing graphs
----------------

The structure of G can be analyzed using various graph-theoretic
functions such as:

>>> G=nx.Graph()
>>> G.add_edges_from([(1,2),(1,3)])
>>> G.add_node("spam")       # adds node "spam"

>>> nx.connected_components(G)
[[1, 2, 3], ['spam']]

>>> sorted(nx.degree(G).values())
[0, 1, 1, 2]

>>> nx.clustering(G)
{1: 0.0, 2: 0.0, 3: 0.0, 'spam': 0.0}

Functions that return node properties return dictionaries keyed by node label.

>>> nx.degree(G)
{1: 2, 2: 1, 3: 1, 'spam': 0}

For values of specific nodes, you can provide a single node or an nbunch
of nodes as argument.  If a single node is specified, then a single value
is returned.  If an nbunch is specified, then the function will
return a dictionary.

>>> nx.degree(G,1)
2
>>> G.degree(1)
2
>>> G.degree([1,2])
{1: 2, 2: 1}
>>> sorted(G.degree([1,2]).values())
[1, 2]
>>> sorted(G.degree().values())
[0, 1, 1, 2]


Details on graph algorithms supported: :doc:`/reference/algorithms`