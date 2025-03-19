package book.index.map2d;

import java.util.TreeSet;

public class Map2dIndexMain {
    public static void main(String[] args) {
        // 构建索引
        Map2dIndex index = Map2dIndex.createIndex(100, 5000, 500, 6000, 3);

        // 查询索引
        TreeSet<Point2d> pointList1 = index.queryPoint(-33, 2511, -66, 3722);
        TreeSet<Point2d> pointList2 = index.queryPoint(1511, 2566, 2753, 3787);
        TreeSet<Point2d> pointList3 = index.queryPoint(1001, 1055, 777, 888);

        System.out.println("===");
    }
}