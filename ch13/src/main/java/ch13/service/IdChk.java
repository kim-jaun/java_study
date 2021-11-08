package ch13.service;

public class IdChk {
	public int idChk(String id, String password) {
		int result = 0;
		if (id.equals("k1") && password.equals("1234")) {
			result = 1;
		}
		return result;		
	}
}