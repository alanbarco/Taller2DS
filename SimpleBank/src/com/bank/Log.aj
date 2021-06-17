package com.bank;

import java.io.File;
import java.util.Calendar;

public aspect Log {
	File file = new File("src/com/bank/Log.txt");
	Calendar cal = Calendar.getInstance();
	pointcut success() : call(* money*(..) );
	before() : success() {
		String content = thisJoinPoint.toString();
		if(content.equals("call(void com.bank.Bank.moneyMakeTransaction())")) {
			System.out.println(" transaccion realizado");
		}else {
			System.out.println("Retiro realizado.");;
		}
	}
}

