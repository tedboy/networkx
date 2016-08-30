Adding attributes to graphs, nodes, and edges
---------------------------------------------
Attributes such as weights, labels, colors, or whatever
Python object you like, can be attached to graphs, nodes, or edges.

Each graph, node, and edge can hold key/value attribute pairs
in an associated attribute dictionary (the keys must be hashable).
By default these are empty, but attributes can be added or changed using
add_edge, add_node or direct manipulation of the attribute
dictionaries named G.graph, G.node and G.edge for a graph G.


Graph attributes
~~~~~~~~~~~~~~~~
Assign graph attributes when creating a new graph

>>> G = nx.Graph(day="Friday")
>>> G.graph
{'day': 'Friday'}

Or you can modify attributes later

>>> G.graph['day']='Monday'
>>> G.graph
{'day': 'Monday'}



Node attributes
~~~~~~~~~~~~~~~

Add node attributes using add_node(), add_nodes_from() or G.node

>>> G.add_node(1, time='5pm')
>>> G.add_nodes_from([3], time='2pm')
>>> G.node[1]
{'time': '5pm'}
>>> G.node[1]['room'] = 714
>>> G.nodes(data=True)
[(1, {'room': 714, 'time': '5pm'}), (3, {'time': '2pm'})]

Note that adding a node to G.node does not add it to the graph,
use G.add_node() to add new nodes.


Edge Attributes
~~~~~~~~~~~~~~~
Add edge attributes using add_edge(), add_edges_from(), subscript
notation, or G.edge.

>>> G.add_edge(1, 2, weight=4.7 )
>>> G.add_edges_from([(3,4),(4,5)], color='red')
>>> G.add_edges_from([(1,2,{'color':'blue'}), (2,3,{'weight':8})])
>>> G[1][2]['weight'] = 4.7
>>> G.edge[1][2]['weight'] = 4

The special attribute 'weight'
should be numeric and holds values used by algorithms requiring weighted edges.