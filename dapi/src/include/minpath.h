#define MAXPATHNODES 100
#define MAXEDGES 500
#define MAXDISTVALUE 32767        // 2^15 -1 for short int.

typedef int EdgeInfo;          // place holder for a handle maybe.


typedef 
struct  {
  SHORT source;
  SHORT destin;
  SHORT weight;
  EdgeInfo info;           // whatever handle you like here.
} 
Gkedge;

typedef 
struct {
  int nnodes;
  int nedges;
  int n_in_S;         // number of nodes in S.
  SHORT dist[MAXPATHNODES];
  SHORT pred[MAXPATHNODES];
  SHORT adj[MAXPATHNODES];    // addresses of first adjacent plus 1
  SHORT nadj[MAXPATHNODES];   // number of adjacent.
  BOOL inS[MAXPATHNODES];
  Gkedge edges[MAXEDGES];
} 
MinPathState;


void init_dkstate(MinPathState *, const int);
void path_addedge(MinPathState *, const SHORT, const SHORT, const SHORT, const EdgeInfo);
int  edge_compare(const void *, const void *);
int sort_edges(MinPathState *);
void print_edges(const MinPathState *);
void print_dkstate(const MinPathState *, const int);
int  extract_min(MinPathState *);

// void  do_relax(MinPathState, int,  int,  int );

void  relax_adjacent(MinPathState *, const int);
void  process_graph(MinPathState *, const int);
EdgeInfo get_edge_info(MinPathState *, const SHORT, const SHORT);
int  track_path(MinPathState *, const int , SHORT *, EdgeInfo *);
