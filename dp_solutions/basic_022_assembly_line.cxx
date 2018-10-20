#include <bits/stdc++.h>

using namespace std;

struct Node {
    // n: node_id, distance from n to this
    vector<pair<int, long long>> parent_edges;

    Node(vector<pair<int, long long>> v) : parent_edges(v) {}
};

// n: node_id -> distance to n
using Cache = unordered_map<int, long long>;
using Graph = pair<vector<Node>, Cache>;

Graph build_graph(vector<Node> v) {
    return make_pair(v, Cache{});
}

// the assembly line problem generalized to n-lines
long long assembly_line(Graph &g, int node) {
    const auto &nodes = g.first;
    auto &node_cache = g.second;

    auto iter = node_cache.find(node);
    if (iter != node_cache.end())
        return iter->second;

    long long distance = LLONG_MAX;
    if (nodes[node].parent_edges.empty())
        distance = 0;

    for (const auto p : nodes[node].parent_edges) {
        long long parent = assembly_line(g, p.first);
        auto sum = parent + p.second;
        if (sum < distance)
            distance = sum;
    }
   
    node_cache[node] = distance;
    return distance;
}

int main() {
    Graph nodes = build_graph({
        Node({ }),
        Node({ {0, 4}, }),
        Node({ {0, 2}, }),
        Node({ {1, 5}, {2, 11}, }),
        Node({ {1, 4}, {2, 10}, }),
        Node({ {3, 5}, {4, 3}, }),
    });

    printf("%lld\n", assembly_line(nodes, 5));
}
