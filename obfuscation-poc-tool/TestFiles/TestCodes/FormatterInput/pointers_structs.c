typedef struct {
    int x;
    int y;
} Point;

void move_point(Point* p, int dx, int dy) {
    p->x += dx;
    p->y += dy;
}

int main() {
    Point pt = {10, 20};
    move_point(&pt, 5, -3);
    printf("New point location: (%d, %d)\n", pt.x, pt.y);
    return 0;
}
