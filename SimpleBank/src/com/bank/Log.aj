package com.bank;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;

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
	after() : success() {
    	String linea = "";
    	String content = thisJoinPoint.toString();
    	String tipo = "";
    	if(content.equals("call(void com.bank.Bank.moneyMakeTransaction())")) {
    		tipo = "Realizar transaccion";
    	}else {
    		tipo = "Retirar dinero";
    	}
    	System.out.println("Entering: " + thisJoinPoint);
    	linea = tipo + " " + cal.getTime().toString() + "\n";
    	System.out.println(cal.getTime());
    	System.out.println(tipo); //
    	FileWriter fichero = null;
    	BufferedWriter bw = null;
    	PrintWriter pw = null;
        try {	
            fichero = new FileWriter(file,true);
            bw = new BufferedWriter(fichero);
            bw.write(linea+"\n");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != fichero) {
                    bw.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}

