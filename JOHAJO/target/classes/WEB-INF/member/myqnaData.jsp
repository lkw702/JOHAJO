<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<store>
	<c:set var="qdto" value="${dto}"/>
		<data>
			<idx>${qdto.idx}</idx>
			<anw>${qdto.anw}</anw>
			<con>${qdto.contents}</con>
			<day>${qdto.writeday}</day>
		</data>
</store>