package hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.json.*;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.postgresql.core.Version;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.stream.JsonWriter;

class Info {
	class Result {
		class Area {
			class Data {

				int cd; // 코드
				int nv; // 현재금액
				int hv; // 최고가
				int pcv; // 전일
				int ov; // 시가
				int lv; // 저가
				int aq; // 거래량

			}

			String name;
			List<Data> datas;
		}

		double time;
		List<Area> areas;
		int pollingInterval;
	}

	Result result;
	String resultCode;

}

public class JsonParser {

	public static void main(String[] args) throws Exception {

		String strTime; // 현재시간 데이터 포맷(sleep용)

		while (true) {
			try {
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat dateF = new SimpleDateFormat("HHmmss");

				int dayNum = cal.get(cal.DAY_OF_WEEK);	// 요일 출력

				strTime = dateF.format(cal.getTime());
				int intTime = Integer.parseInt(strTime);

				//System.out.println("현재 시간 : " + intTime);

				// 1:일요일, 7:토요일
				if ((dayNum == 1) || (dayNum == 7)) {
//					System.out.println("주말에는 개장하지 않습니다");
					break;
				} else {
					if (intTime >= 100000 && 153000 >= intTime) {
//						System.out.println(intTime + " 에 데이터 저장 완료");
						Thread.sleep(9000);
						JSONParser parser = new JSONParser();

						Connection conn = null; // 특정 데이터 객체와 연동 시켜주는 객체
						Statement st = null; //
						ResultSet rs = null; // Select 쿼리 질의 성공시 결과물로 ResultSet 반환
						PreparedStatement pst = null; // insert 할때

						//String dbUrl = "jdbc:postgresql://221.143.46.41:35432/green";
						 String dbUrl = "jdbc:postgresql://localhost/green";

						String user = "greenart2017";
						String pw = "greengreen!!";

						// String dbUrl = "jdbc:postgresql://localhost/postgres"; // 서버 주소(현재는
						// localhost) 와 DB명
						// String user = "postgres"; // DB ID
						// String pw = "greengreen!!"; // DB PW

						String[] array = { "KOSPi", "KOSDAQ" };
						String[] stockArray = { "035720", "005930", "066570", "005380", "000660", "035420" };
						// 카카오, 삼성전자, LG전자, 현대차, SK하이닉스, 네이버

						try {
							for (int i = 0; i < stockArray.length; i++) {
								URL url = new URL(
										"http://polling.finance.naver.com/api/realtime.nhn?query=SERVICE_ITEM:"
												+ stockArray[i] + "|SERVICE_RECENT_ITEM:" + stockArray[i]); // URL
								// to
								// Parse
								URLConnection yc = url.openConnection();
								BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

								String inputLine = in.readLine();

								Gson json = new Gson();
								Info info = json.fromJson(inputLine, Info.class);
								// String success = info.resultCode;

								int code = info.result.areas.get(0).datas.get(0).cd; // 코드.cd
								int currentAccount = info.result.areas.get(0).datas.get(0).nv; // 현재금액.nv
								int highValue = info.result.areas.get(0).datas.get(0).hv; // 최고가.hv
								int previousValue = info.result.areas.get(0).datas.get(0).pcv; // 전일.pcv
								int marketValue = info.result.areas.get(0).datas.get(0).ov; // 시가.ov
								int lowValue = info.result.areas.get(0).datas.get(0).lv; // 저가.lv
								int accountQuantity = info.result.areas.get(0).datas.get(0).aq; // 거래량.aq

								int[] columnArray = { code, currentAccount, highValue, previousValue, marketValue,
										lowValue, accountQuantity };

								try {
									conn = DriverManager.getConnection(dbUrl, user, pw); // DriverManager : Connection 을
																							// 사용하기 위해 생성
									st = conn.createStatement();
									rs = st.executeQuery("SELECT * FROM kospiGroup");

									String stm = "INSERT INTO kospiGroup(code, currentAccount, highValue, previousValue"
											+ ", marketValue, lowValue, accountQuantity, savetime)"
											+ "VALUES(?, ?, ?, ?, ?, ?, ?, 'now()')";
									pst = conn.prepareStatement(stm);
									String codeConvert = String.format("%05d", code);
									pst.setString(1, codeConvert);
									pst.setString(2, String.valueOf(currentAccount));
									pst.setString(3, String.valueOf(highValue));
									pst.setString(4, String.valueOf(previousValue));
									pst.setString(5, String.valueOf(marketValue));
									pst.setString(6, String.valueOf(lowValue));
									pst.setString(7, String.valueOf(accountQuantity));
									/*
									 * for(int j=1; j<=7; j++) { pst.setString(j, String.valueOf(columnArray[j-1]));
									 * 
									 * }
									 */
									pst.executeUpdate(); // 테이블 update 즉, insert 명령 실행

									/*
									 * st = conn.createStatement(); rs = st.executeQuery("SELECT * FROM books");
									 * 
									 * while (rs.next()) { System.out.print(rs.getInt(1) + ", ");
									 * System.out.println(rs.getString(3)); }
									 */
								} catch (SQLException ex) {
									Logger lgr = Logger.getLogger(Version.class.getName());
									lgr.log(Level.SEVERE, ex.getMessage(), ex);
								} finally {
									try {
										if (rs != null) {
											rs.close();
										}
										if (st != null) {
											st.close();
										}
										if (conn != null) {
											conn.close();
										}
									} catch (SQLException ex) {
										Logger lgr = Logger.getLogger(Version.class.getName());
										lgr.log(Level.WARNING, ex.getMessage(), ex);
									}
								}

								// String cv = info.result.areas[0];

								// JSONObject input = (JSONObject)parser.parse(inputLine);
								// JSONObject result = (JSONObject)input.get("result");
								// JSONArray areas = (JSONArray)result.get("areas");
								// JSONObject areas_0 = (JSONObject)areas.get(0);
								// JSONArray datas = (JSONArray)areas_0.get("datas");
								// JSONObject datas_0 = (JSONObject)datas.get(0);
								// String ms = datas_0.get("ms").toString();

								in.close();
							}
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					} else {
	//					System.out.println("개장 시간이 아니므로, break전환//현재 시각 : " + intTime);
						break;
					}
				}

			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			long time = System.currentTimeMillis();

			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			String str = dayTime.format(new Date(time));
//			System.out.println(str);
		}
	}

	public JsonElement parse(String str) {
		// TODO Auto-generated method stub
		return null;
	}
}
