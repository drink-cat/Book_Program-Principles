package book.index.map2d;

public class Point2d implements Comparable<Point2d> {
    int valueX;// X值
    int valueY;// Y值

    public static Point2d fromXY(int x, int y) {
        Point2d point2d = new Point2d();
        point2d.valueX = x;
        point2d.valueY = y;
        return point2d;
    }

    // 水平线与垂直线相交，生成点
    public static Point2d fromLine(Line2d horizonLine, Line2d verticalLine) {
        Point2d point2d = new Point2d();
        point2d.valueX = verticalLine.valueX;
        point2d.valueY = horizonLine.valueY;
        return point2d;
    }

    // 点排序
    @Override
    public int compareTo(Point2d tmp) {
        int ret = Integer.compare(this.valueX, tmp.valueX);
        if (0 != ret) {
            return ret;
        }
        return Integer.compare(this.valueY, tmp.valueY);
    }

    @Override
    public String toString() {
        return "( " + valueX + " , " + valueY + " )";
    }
}