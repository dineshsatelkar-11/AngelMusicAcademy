<%-- 
    Document   : fetchcourse
    Created on : Jun 13, 2017, 2:47:20 PM
    Author     : Accede
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




		                      <form:form  cssClass="form-horizontal text-center" modelAttribute="user" method="post" >     
		                            	<form:select cssClass="form-control"  path="userCourse" value="${userObject.userCourse}">
                                   
                                    <c:forEach var="course" items="${courseList}">
                                        <form:option value="${course.courseName}">${course.courseName}</form:option>
                                    </c:forEach>

                                </form:select>
                                               
                              </form:form>