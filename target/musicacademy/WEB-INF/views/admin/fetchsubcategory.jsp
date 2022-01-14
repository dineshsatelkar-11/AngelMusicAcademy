<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



 <form:form  cssClass="form-horizontal text-center" modelAttribute="product" method="post" >

 <form:select  cssClass="form-control" path="instrumentSubcategory.instrumentSubcategoryId" value="${product.instrumentSubcategory.instrumentSubcategoryId}">
		                            		<c:forEach var="instrument" items="${instrumentSubcategory}">
												<form:option value="${instrument.instrumentSubcategoryId}">${instrument.instrumentSubcategoryName}</form:option>
											</c:forEach>
		                            	   	
                       				</form:select>
                       				</form:form>