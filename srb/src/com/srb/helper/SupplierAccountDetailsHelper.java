/*package com.srb.helper;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;

import javax.mail.Session;
import javax.management.Query;

import com.srb.utility.HibernateUtility;

import antlr.collections.List;

public class SupplierAccountDetailsHelper {



	SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
	List list = dao.getYesterdarTotalAmount();

	if (list.size() == 0) {

		String yesterday = null;
		final Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		cal.add(Calendar.DATE, -1);
		yesterday = dateFormat.format(cal.getTime());
		System.out.println("Yesterday Date ===+++ " + yesterday);

		CashBankBookDataDateWise cs = new CashBankBookDataDateWise();

		cs.setDate(yesterday);
		cs.setTotalAmount(0.0d);

		SupplierAccountDetailsDao doa = new SupplierAccountDetailsDao();
		doa.registeryesterdayTotal(cs);
		// List list1= dao.getYesterdaySuppCredit(yesterday);

	} else {
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			
			 * TadayRemainingBalance bean = new TadayRemainingBalance();
			 * System.out.println(Arrays.toString(o));
			 * bean.setDate(o[0].toString());
			 * bean.setTotalAmt(Double.parseDouble(o[1].toString()));
			 

			String yesDate = o[0].toString();
			Double yesTotal = Double.parseDouble(o[1].toString());

			
			 * SimpleDateFormat dateFormat1 = new
			 * SimpleDateFormat("yyyy-MM-dd"); Date dateobj = new Date();
			 * System.out.println(dateFormat1.format(dateobj)); String
			 * currDate = dateFormat1.format(dateobj);
			 

			String yesterday = null;
			final Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -1);

			yesterday = dateFormat.format(cal.getTime());

			System.out.println("Yesterday Datjhgjhe ===+++ " + yesterday);

			if (yesDate.equals(yesterday)) {

				System.out.println("hello shreemant");
				break;

			} else {
				// List list2= dao.getDiffBetDates();
				String credit = "credit";
				String debit = "debit";
				SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				Date dateobj = new Date();
				String todayDate = dateFormat1.format(dateobj);
				System.out.println("Today Date :::: " + todayDate);
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();

				Query query = session
						.createSQLQuery("select onDate , DATEDIFF(:todayDate,:yesDate) from cashbankbooktable");

				query.setParameter("yesDate", yesDate);
				query.setParameter("todayDate", todayDate);
				List<Object[]> list1 = query.list();
				String diff = null;
				for (Object[] objects : list1) {

					diff = (objects[1].toString());
					System.out.println("date Difference is ==++ " + diff);

				}
				Integer datediff = Integer.parseInt(diff);

				for (int j = 1; j < datediff; j++) {

					String diffDate = null;
					int abc = datediff - j;
					System.out.println("shree == ++" + abc);
					final Calendar calc = Calendar.getInstance();
					SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
					calc.add(Calendar.DATE, -abc);
					diffDate = dateFormat2.format(calc.getTime());
					System.out.println("diff Dates ::::  " + diffDate);

					Query query1 = session.createSQLQuery(
							"select bill_no, sum(payment) from supplier_payment where paymentType=:credit and insert_date=:diffDate");

					query1.setParameter("credit", credit);
					query1.setParameter("diffDate", diffDate);
					Double suppTotal = 0d;
					List<Object[]> list2 = query1.list();
					// String diff = null;
					for (Object[] objects : list2) {
						System.out.println("objects  ==  " + Arrays.toString(objects));
						System.out.println("Size  ==  " + list2.size());
						if (objects[1] == null) {
							suppTotal = 0.0d;
						} else {
							suppTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Supplier Credit Amount ==++ " + suppTotal);
					}

					Query query2 = session.createSQLQuery(
							"select fk_employee_id, sum(payment) from employee_payment where paymentType=:credit and insert_date=:diffDate");

					query2.setParameter("credit", credit);
					query2.setParameter("diffDate", diffDate);
					Double empTotal = 0d;
					List<Object[]> list3 = query2.list();
					// String diff = null;
					for (Object[] objects : list3) {

						if (objects[1] == null) {
							empTotal = 0.0d;
						} else {
							empTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Employee Credit Amount ==++ " + empTotal);
					}

					Query query3 = session.createSQLQuery(
							"select bill_no, sum(payment) from credit_customer_payment where paymentType=:credit and insert_date=:diffDate");

					query3.setParameter("credit", credit);
					query3.setParameter("diffDate", diffDate);
					Double custTotal = 0d;
					List<Object[]> list4 = query3.list();
					// String diff = null;
					for (Object[] objects : list4) {

						if (objects[1] == null) {
							custTotal = 0.0d;
						} else {
							custTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Customer Credit Amount ==++ " + custTotal);
					}

					Query query4 = session.createSQLQuery(
							"select fk_expense_detail_id, sum(credit) from expenditure_payment where insert_date=:diffDate");

					query4.setParameter("diffDate", diffDate);
					Double expanTotal = 0.0d;
					List<Object[]> list5 = query4.list();
					// String diff = null;
					for (Object[] objects : list5) {

						if (objects[1] == null) {
							expanTotal = 0.0d;
						} else {
							expanTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("expandecture Credit Amount ==++ " + expanTotal);
					}

					Query query5 = session.createSQLQuery(
							"select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from fertilizer_billing where insert_date=:diffDate");

					query5.setParameter("diffDate", diffDate);
					Double saleTotal = 0d;
					List<Object[]> list6 = query5.list();
					// String diff = null;
					for (Object[] objects : list6) {

						if (objects[1] == null) {
							saleTotal = 0.0d;
						} else {
							saleTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("fertilizer Sale Amount ==++ " + saleTotal);
					}

					Query query6 = session.createSQLQuery(
							"select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from seed_pesticide_billing where insert_date=:diffDate");

					query6.setParameter("diffDate", diffDate);
					Double saleTotal1 = 0.0d;
					List<Object[]> list7 = query6.list();
					// String diff = null;
					for (Object[] objects : list7) {

						if (objects[1] == null) {
							saleTotal1 = 0.0d;
						} else {
							saleTotal1 = Double.parseDouble(objects[1].toString());
						}
						System.out.println("seed Pestiside Amount ==++ " + saleTotal1);
					}

					Query query10 = session.createSQLQuery(
							"select bill_no, sum(payment) from supplier_payment where paymentType=:debit and insert_date=:diffDate");

					query10.setParameter("debit", debit);
					query10.setParameter("diffDate", diffDate);
					Double suppdebitTotal = 0.0d;
					List<Object[]> list10 = query10.list();
					// String diff = null;
					for (Object[] objects : list10) {

						if (objects[1] == null) {
							suppdebitTotal = 0.0d;
						} else {
							suppdebitTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Supplier debit Amount ==++ " + suppdebitTotal);
					}

					Query query11 = session.createSQLQuery(
							"select fk_employee_id, sum(payment) from employee_payment where paymentType=:debit and insert_date=:diffDate");

					query11.setParameter("debit", debit);
					query11.setParameter("diffDate", diffDate);
					Double empdebitTotal = 0.0d;
					List<Object[]> list11 = query11.list();
					// String diff = null;
					for (Object[] objects : list11) {

						if (objects[1] == null) {
							empdebitTotal = 0.0d;
						} else {
							empdebitTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Employee debit Amount ==++ " + empdebitTotal);
					}

					Query query12 = session.createSQLQuery(
							"select bill_no, sum(payment) from credit_customer_payment where paymentType=:debit and insert_date=:diffDate");

					query12.setParameter("debit", debit);
					query12.setParameter("diffDate", diffDate);
					Double custdebitTotal = 0.0d;
					List<Object[]> list12 = query12.list();
					// String diff = null;
					for (Object[] objects : list12) {

						if (objects[1] == null) {
							custdebitTotal = 0.0d;
						} else {
							custdebitTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("Customer debit Amount ==++ " + custdebitTotal);
					}

					Query query13 = session.createSQLQuery(
							"select fk_expense_detail_id, sum(debit) from expenditure_payment where insert_date=:diffDate");

					query13.setParameter("diffDate", diffDate);
					Double expandebitTotal = 0d;
					List<Object[]> list13 = query13.list();
					// String diff = null;
					for (Object[] objects : list13) {

						if (objects[1] == null) {
							expandebitTotal = 0.0d;
						} else {
							expandebitTotal = Double.parseDouble(objects[1].toString());
						}
						System.out.println("expandecture debit Amount ==++ " + expandebitTotal);
					}

					Query query7 = session.createSQLQuery(
							"SELECT onDate , totalAmount FROM cashbankbooktable ORDER BY pkLastCashId DESC LIMIT 1");

					Double previousTotal = 0.0d;
					List<Object[]> list8 = query7.list();
					// String diff = null;
					for (Object[] objects : list8) {

						previousTotal = Double.parseDouble(objects[1].toString());

						System.out.println("seed Pestiside Amount ==++ " + saleTotal1);
					}

					Double finalTotal = (previousTotal + saleTotal1 + saleTotal + suppdebitTotal + empdebitTotal
							+ custdebitTotal + expandebitTotal) - (suppTotal + empTotal + custTotal + expanTotal);

					CashBankBookDataDateWise cs1 = new CashBankBookDataDateWise();

					cs1.setDate(diffDate);
					cs1.setTotalAmount(finalTotal);

					SupplierAccountDetailsDao doa = new SupplierAccountDetailsDao();
					doa.registeryesterdayTotal(cs1);
				}

			}

		}
	}
}
}
*/