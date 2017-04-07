package Utilities;

public class utility {

	/**
	 * null일 경우 공백으로 돌려주는 함수
	 * @param gets
	 * @return String parameter
	 */
	public String nullToString (String gets){
		if(gets == null){
			return "";
		}else{
		return gets;
		}
	}
}
