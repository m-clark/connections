load('data/gp.RData')
load('data/star.RData')
load('data/basics.RData')



library(DiagrammeR)
gp_graph = create_graph(gp_nodes, gp_edges)
star_graph = create_graph(star_nodes, star_edges)
# render_graph(combine_graphs(gp_graph, star_graph)) # seriously, wtf


combo_nodes = rbind(basics_nodes, gp_nodes, star_nodes, sem_nodes)
combo_edges = rbind(basics_edges, gp_edges, star_edges, sem_edges)

# remove dupe edges
library(tidyverse)
dup_index = duplicated(combo_edges %>% select(from, to))

render_graph(create_graph(combo_nodes, filter(combo_edges, !dup_index)))

