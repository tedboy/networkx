What to use as nodes and edges
------------------------------
You might notice that nodes and edges are not specified as NetworkX
objects.  This leaves you free to use meaningful items as nodes and
edges. The most common choices are numbers or strings, but a node can
be any hashable object (except None), and an edge can be associated
with any object x using G.add_edge(n1,n2,object=x).

As an example, n1 and n2 could be protein objects from the RCSB Protein
Data Bank, and x could refer to an XML record of publications detailing
experimental observations of their interaction.

We have found this power quite useful, but its abuse
can lead to unexpected surprises unless one is familiar with Python.
If in doubt, consider using :func:`convert_node_labels_to_integers` to obtain
a more traditional graph with integer labels.