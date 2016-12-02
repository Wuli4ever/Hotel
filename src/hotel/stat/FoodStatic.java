package hotel.stat;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import hotel.order.*;
import hotel.food.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

public class FoodStatic {
	
	public static void getChart() throws IOException {
		CategoryDataset dataset = getDataSet();
		JFreeChart chart = ChartFactory.createBarChart3D(
							"食品数据统计", // 图表标题
							"食品", // 目录轴的显示标签
							"数量", // 数值轴的显示标签
							dataset, // 数据集
							PlotOrientation.VERTICAL, // 图表方向：水平、垂直
							true, 	// 是否显示图例(对于简单的柱状图必须是false)
							false, 	// 是否生成工具
							false 	// 是否生成URL链接
							);
							
		FileOutputStream fos_jpg = null;
		try {
			fos_jpg = new FileOutputStream("D:\\apache-tomcat-6.0.14\\apache-tomcat-6.0.14\\webapps\\Hotel\\photo\\foods.jpg");
			
			ChartUtilities.writeChartAsJPEG(fos_jpg,1,chart,800,500,null);
		} finally {
			try {
				fos_jpg.close();
			} catch (Exception e) {}
		}
	}
	
	private static CategoryDataset getDataSet() {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		List<Food> foods = OrderItem.getFoodsAndCount();
		for(int i=0;i<foods.size();i++) {
			Food f = foods.get(i);
			dataset.addValue(f.getNumber(),"",f.getName());
		}
		
		return dataset;
	}
}