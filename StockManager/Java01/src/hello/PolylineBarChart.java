package hello;

import java.awt.BasicStroke;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.sql.SQLException;

import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.CategoryItemLabelGenerator;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.Range;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;

public class PolylineBarChart {

	public static void main(String[] args) {
		PolylineBarChart demo = new PolylineBarChart();
		BtnFunction bf = new BtnFunction();
		JFreeChart chart = demo.getChart();
		ChartFrame frame1 = new ChartFrame("Bar Chart", chart);
		frame1.setSize(1600, 700);
		frame1.setVisible(true);
	}
	
	public JFreeChart getChart() {

		ConnectionDB connDB = new ConnectionDB();
		try {
			connDB.dbConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = connDB.GetResult();

		try {
			if (rs == null || rs.isBeforeFirst()) {
				System.out.println("불러올 데이터 X");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터 생성
		DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();

		// 데이터 입력(값, 범례, 카테고리)
		// int i = 0;

		double maxValue = 0;
		double minValue = 0;
		double currentValue=0;
		double a = 1;
		int c=0;
		try {
			maxValue = 0;
			rs.next();
			minValue = Double.parseDouble(rs.getString("CurrentAccount"));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {

			while (rs.next()) {
				// System.out.println(rs.getString(1));
				// System.out.println(rs.getString(2));
				currentValue = Integer.parseInt(rs.getString("CurrentAccount"));
				if(a!=currentValue) {
				
				if (currentValue > maxValue) {
					maxValue = currentValue;
				}

				if (currentValue < minValue) {
					minValue = currentValue;
				}
				System.out.println(currentValue);
				//System.out.println("MAX : " + maxValue);
				//System.out.println("MIN : " + minValue);
				c++;
				dataset1.addValue(currentValue, "네이버", "\"" + rs.getString("savetime") + "\"");
				a=currentValue;
				}
				// dataset1.addValue(Integer.parseInt(rs.getString("CurrentAccount")), "T1",
				// "\"" + rs.getString("savetime") + "\"");
			}System.out.println(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 랜더링 생성
		final LineAndShapeRenderer renderer = new LineAndShapeRenderer();

		// 공통 옵션 정의
		final CategoryItemLabelGenerator generator = new StandardCategoryItemLabelGenerator();
		final ItemLabelPosition p_center = new ItemLabelPosition(ItemLabelAnchor.CENTER, TextAnchor.CENTER);
		final ItemLabelPosition p_below = new ItemLabelPosition(ItemLabelAnchor.OUTSIDE6, TextAnchor.TOP_LEFT);
		Font f = new Font("Gulim", Font.BOLD, 14);
		Font xAxis = new Font("Gulim", Font.PLAIN, 7);
		Font yAxis = new Font("Gulim", Font.PLAIN, 16);

		// 랜더링 세팅
		renderer.setBaseItemLabelGenerator(generator);
		renderer.setBaseItemLabelsVisible(false); // 그래프 위 숫자 표시
		renderer.setBaseShapesVisible(false); // 그래프 위 네모 표시
		// renderer.setUseFillPaint(true);
		// renderer.setBaseFillPaint(Color.WHITE);
		renderer.setBaseItemLabelFont(f);
		renderer.setBasePositiveItemLabelPosition(p_below);
		renderer.setSeriesPaint(0, new Color(219, 121, 22)); // 선 색깔
		renderer.setSeriesStroke(0, new BasicStroke(2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND, 3.0f));
			
		// plot 생성
		final CategoryPlot plot = new CategoryPlot();

		// plot 에 데이터 적재
		plot.setDataset(dataset1);
		plot.setRenderer(renderer);

		// plot 기본 설정
		plot.setOrientation(PlotOrientation.VERTICAL); // 그래프 표시 방향
		plot.setRangeGridlinesVisible(false); // 데이터 금액 가이드 라인(선택)
		plot.setDomainGridlinesVisible(false); // 시간 단위 가이드 라인(선택)

		// 랜더링 순서 정의 : dataset 등록 순서대로 랜더링(먼저 등록한 놈은 아래로 깔림)
		plot.setDatasetRenderingOrder(DatasetRenderingOrder.FORWARD);

		plot.setDomainAxis(new CategoryAxis()); // x축 종류 설정
		plot.getDomainAxis().setTickLabelFont(xAxis); // x축 눈금라벨 폰트

		plot.setRangeAxis(new NumberAxis()); // y축 종류 설정
		plot.getRangeAxis().setTickLabelFont(yAxis); // y축 눈금라벨 폰트
		// plot.getRangeAxis().setRange(80000.0,90000.0);

		Range range = new Range(minValue, maxValue);
		plot.getRangeAxis().setRange(range);

		// 카테고리 라벨 위치
		plot.getDomainAxis().setCategoryLabelPositions(CategoryLabelPositions.STANDARD);

		// 세팅된 plot을 chart 로 생성
		final JFreeChart chart = new JFreeChart(plot);

		return chart;

	}
}

class ConnectionDB {

	ResultSet rs = null; // Select 쿼리 질의 성공시 결과물로 ResultSet 반환
	List<ResultSet> list = new ArrayList<ResultSet>();

	public ResultSet GetResult() {
		return rs;
	}

	public List<ResultSet> GetResultList() {
		return list;
	}

	public void dbConn() throws SQLException {
		try {
			Connection conn = null; // 특정 데이터 객체와 연동 시켜주는 객체
			Statement st = null; //

			PreparedStatement pst = null; // insert 할때

			String dbUrl = "jdbc:postgresql://221.143.46.41:35432/green";
			String user = "greenart2017";
			String pw = "greengreen!!";
			String sql = "SELECT currentAccount, savetime FROM kospigroup" + " WHERE code = '00660'";

			conn = DriverManager.getConnection(dbUrl, user, pw); // DriverManager : Connection 을
			st = conn.createStatement();
			rs = st.executeQuery(sql);

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
