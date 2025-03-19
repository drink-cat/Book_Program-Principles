package book.index.map2d;

import java.util.TreeSet;

public class Line2d implements Comparable<Line2d> {
    boolean beHorizon;// 水平线或垂直线
    int valueX;// X值
    int valueY;// Y值
    TreeSet<Point2d> pointList = new TreeSet<>();// 点

    // 垂直线
    public static Line2d newVertical(int x) {
        Line2d line = new Line2d();
        line.valueX = x;
        line.valueY = 0;
        line.beHorizon = false;
        return line;
    }

    // 水平线
    public static Line2d newHorizon(int y) {
        Line2d line = new Line2d();
        line.valueX = 0;
        line.valueY = y;
        line.beHorizon = true;
        return line;
    }

    @Override
    public int compareTo(Line2d tmp) {
        if (beHorizon) {
            // 2个水平线，只需要比较Y值
            return Integer.compare(this.valueY, tmp.valueY);
        } else {
            // 2个垂直线，只需要比较X值
            return Integer.compare(this.valueX, tmp.valueX);
        }
    }
}