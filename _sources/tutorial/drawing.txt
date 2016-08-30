Drawing graphs
--------------

NetworkX is not primarily a graph drawing package but
basic drawing with Matplotlib as well as an interface to use the
open source Graphviz software package are included.
These are part of the networkx.drawing package
and will be imported if possible.
See :doc:`/reference/drawing` for details.

Note that the drawing package in NetworkX is not yet compatible with
Python versions 3.0 and above.

First import Matplotlib's plot interface (pylab works too)

>>> import matplotlib.pyplot as plt

You may find it useful to interactively test code using "ipython -pylab",
which combines the power of ipython and matplotlib and provides a convenient
interactive mode.

To test if the import of networkx.drawing was successful
draw G using one of

>>> nx.draw(G)
>>> nx.draw_random(G)
>>> nx.draw_circular(G)
>>> nx.draw_spectral(G)

when drawing to an interactive display.
Note that you may need to issue a Matplotlib

>>> plt.show()

command if you are not using matplotlib in interactive mode: (See
`Matplotlib FAQ <http://matplotlib.org/faq/installing_faq.html#matplotlib-compiled-fine-but-nothing-shows-up-when-i-use-it>`_
)

To save drawings to a file, use, for example

>>> nx.draw(G)
>>> plt.savefig("path.png")

writes to the file "path.png" in the local directory. If Graphviz
and PyGraphviz, or pydotplus, are available on your system, you can also use

>>> from networkx.drawing.nx_pydot import write_dot
>>> nx.draw_graphviz(G)
>>> write_dot(G,'file.dot')

Details on drawing graphs: :doc:`/reference/drawing`