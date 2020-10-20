package com.srb.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ProductDetailsBean;
import com.srb.dao.ProductDetailsDao;
import com.srb.dao.SupplierDetailsDao;
import com.srb.hibernate.ProductDetailsHibernate;
import com.srb.utility.HibernateUtility;

public class ProductDetailsHelper 
{
	public void addProductDetails(HttpServletRequest request, HttpServletResponse response) 
	{
		String productName = request.getParameter("productNameDetail");
		String unit = request.getParameter("unit");
		String quantityLimit = request.getParameter("quantityLimit");
		String Description =request.getParameter("Description");
		
		ProductDetailsHibernate bean = new ProductDetailsHibernate();
		
		bean.setProductName(productName);
		bean.setUnit(unit);
		bean.setQuantityLimit(Long.parseLong(quantityLimit));
		bean.setDescription(Description);
		
		ProductDetailsDao dao  = new ProductDetailsDao();
		dao.addProductDetails(bean);
	}
	
	public void deleteSchool(HttpServletRequest request, HttpServletResponse response ) {
		
		String fk_School_id = request.getParameter("fk_School_id");
		System.out.println("hi this is delProName =="+fk_School_id);
		   
		ProductDetailsDao dao2 = new ProductDetailsDao();
		dao2.deleteProduct(fk_School_id);
			
		}
	//
	public void deletecomp(HttpServletRequest request, HttpServletResponse response ) {
		
		String fk_School_id = request.getParameter("fk_School_id");
		System.out.println("hi this is comp ==  "+fk_School_id);
		   
		ProductDetailsDao dao2 = new ProductDetailsDao();
		dao2.deletecomplaint(fk_School_id);
			//https://github.com/embelgit/shop
		}
	//employee Detailas for edit
	public List getProductQuantity(String fkProductId, String productName)
	{
		
		Map<Long, ProductDetailsBean> map = new HashMap<Long, ProductDetailsBean>();

		ProductDetailsDao dao  = new ProductDetailsDao();
		List<ProductDetailsBean> exp1List = dao.getProductTotalQuantity(fkProductId,productName);

		System.out.println("Size in Helper------ : "+exp1List.size());
		
		return exp1List;

	}
	
	
	//Product Detailas for edit
	
		public List getProductDetails(Long fkProductId)
		{
			
			Map<Long, ProductDetailsBean> map = new HashMap<Long, ProductDetailsBean>();

			ProductDetailsDao dao = new ProductDetailsDao();
			List<ProductDetailsBean> ven1List = dao.getProductDetailsEdit(fkProductId);

			
			return ven1List;

		}
	
		
		// update Product Details
		public void updateProductDetails(HttpServletRequest request, HttpServletResponse response) 
		{
			String productId2 = request.getParameter("fkProductId");
			
			String newProductName = request.getParameter("newProductName");
			String unit = request.getParameter("unit");
			String quantityLimit = request.getParameter("quantityLimit");
			String desp = request.getParameter("desp");
			
			com.srb.utility.HibernateUtility hbu=null;
			Session session = null;
			Transaction transaction = null;
			
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
			
		
			Long productId 	= Long.parseLong(productId2);
			
			ProductDetailsHibernate pdh = (ProductDetailsHibernate) session.load(ProductDetailsHibernate.class, productId);

			pdh.setProductName(newProductName);
			pdh.setUnit(unit);
			pdh.setQuantityLimit(Long.parseLong(quantityLimit));
			pdh.setDescription(desp);
			session.saveOrUpdate(pdh);
			transaction.commit();
			
		}
	
	//
		public void deleteproduct(HttpServletRequest request, HttpServletResponse response ) {
			
			String pro_id = request.getParameter("pro_id");
			   
			ProductDetailsDao dao2 = new ProductDetailsDao();
			dao2.deleteproductss(pro_id);
				
			}
	

}
