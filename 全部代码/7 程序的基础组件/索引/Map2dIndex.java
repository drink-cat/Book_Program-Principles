package book.index.map2d;

import java.util.NavigableSet;
import java.util.TreeSet;

public class Map2dIndex {
    int intervalLine = 5;// 线的间隔
    TreeSet<Line2d> lineHorizonList = new TreeSet<>();// 水平线
    TreeSet<Line2d> lineVerticalList = new TreeSet<>();// 垂直线
    int pointCount = 0;// 点的数量

    // 用边界生成地图索引
    public static Map2dIndex createIndex(int minX, int maxX, int minY, int maxY, int intervalLine) {
        long millis = System.currentTimeMillis();
        Map2dIndex index = new Map2dIndex();
        index.intervalLine = intervalLine;
        index.buildLine(minX, maxX, minY, maxY);// 生成直线
        index.buildPoint();// 生成点
        long costMillis = System.currentTimeMillis() - millis;
        StringBuilder buf = new StringBuilder(300).append("createIndex").append("  costMillis=").append(costMillis)
            .append("  lineHorizonList=").append(index.lineHorizonList.size()).append("  lineVerticalList=")
            .append(index.lineVerticalList.size()).append("  pointCount=").append(index.pointCount);
        System.out.println(buf.toString());
        return index;
    }

    // 生成直线
    private void buildLine(int minX, int maxX, int minY, int maxY) {
        // 全部的垂直线
        for (int tmpX = minX; tmpX <= maxX; tmpX = tmpX + intervalLine) {
            lineVerticalList.add(Line2d.newVertical(tmpX));
        }
        // 全部的水平线
        for (int tmpY = minY; tmpY <= maxY; tmpY = tmpY + intervalLine) {
            lineHorizonList.add(Line2d.newHorizon(tmpY));
        }
    }

    // 生成点
    private void buildPoint() {
        // 水平线与垂直线相交，生成点
        for (Line2d horizonLine : lineHorizonList) {
            for (Line2d verticalLine : lineVerticalList) {
                Point2d point2d = Point2d.fromLine(horizonLine, verticalLine);
                ++pointCount;
                // 点与直线的关系
                horizonLine.pointList.add(point2d);
                verticalLine.pointList.add(point2d);
            }
        }
    }

    // 范围查询。查询点列表。
    public TreeSet<Point2d> queryPoint(int minX, int maxX, int minY, int maxY) {
        long millis = System.currentTimeMillis();
        // 范围查询
        NavigableSet<Line2d> subHorizon = lineHorizonList.subSet(Line2d.newHorizon(minY), true, Line2d.newHorizon(maxY), true);
        TreeSet<Point2d> pointList = new TreeSet<>();// 点
        for (Line2d horizonLine : subHorizon) {
            // 范围查询
            Point2d leftPoint = Point2d.fromXY(minX, horizonLine.valueY);
            Point2d rightPoint = Point2d.fromXY(maxX, horizonLine.valueY);
            NavigableSet<Point2d> subPoint = horizonLine.pointList.subSet(leftPoint, true, rightPoint, true);
            pointList.addAll(subPoint);
        }
        long costMillis = System.currentTimeMillis() - millis;
        StringBuilder buf = new StringBuilder(300).append("queryPoint ").append("  costMillis=").append(costMillis)
            .append("  pointCount=").append(pointList.size()).append("  rangeX=").append(minX + "~" + maxX)
            .append("  rangeY=").append(minY + "~" + maxY);
        System.out.println(buf.toString());
        return pointList;
    }
}