#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using namespace std;

struct Point {
    int x, y;
    Point(int x, int y) : x(x), y(y) {}
};

struct Shape {
    virtual ~Shape() = default;
};

struct Rectangle: Shape {
    Point p1, p2;
    Rectangle(Point p1, Point p2) : p1(p1), p2(p2) {}
};

struct Circle: Shape {
    Point c;
    int r;
    Circle(Point c, int r) : c(c), r(r) {}
};

double distance(Point p1, Point p2) {
    return hypot(fabs(p1.x - p2.x), fabs(p1.y - p2.y));
}

bool in_rect(Rectangle r, Point p) {
    return p.x >= r.p1.x && p.x <= r.p2.x
        && p.y >= r.p1.y && p.y <= r.p2.y;
}

bool in_circle(Circle c, Point p) {
    return distance(c.c, p) <= c.r;
}

int main() {
    int m;
    cin >> m;

    vector<Shape *> shapes;

    while (m--) {
        string shape;
        cin >> shape;
        if (shape == "rectangle") {
            int x1, y1, x2, y2;
            cin >> x1 >> y1 >> x2 >> y2;
            shapes.push_back(new Rectangle(Point(x1, y1), Point(x2, y2)));
        } else if (shape == "circle") {
            int x, y, r;
            cin >> x >> y >> r;
            shapes.push_back(new Circle(Point(x, y), r));
        }
    }

    int n;
    cin >> n;

    while (n--) {
        int x, y;
        cin >> x >> y;
        Point p = {x, y};
        int hits = 0;
        for (Shape *shape : shapes) {
            Rectangle *r;
            Circle *c;
            if (r = dynamic_cast<Rectangle *>(shape))
                hits += (int)in_rect(*r, p);
            else if (c = dynamic_cast<Circle *>(shape))
                hits += (int)in_circle(*c, p);
        }
        cout << hits << '\n';
    }

    for (auto shape : shapes)
        delete shape;
}
