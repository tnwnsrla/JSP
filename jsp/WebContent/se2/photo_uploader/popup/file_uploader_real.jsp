<%@page import="java.io.File"%>
<%@page import="com.talanton.homepage.pds.model.AddRequest"%>
<%@page import="java.util.List"%>
<%@page import="com.talanton.homepage.common.utilities.SmartEditorImageManager"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	request.setCharacterEncoding("utf-8");
	String[] src = request.getParameterValues("src");
	String[] title = request.getParameterValues("title");
	
	SmartEditorImageManager imageManager = SmartEditorImageManager.getInstance();
	List<AddRequest> imageList = imageManager.getImageList();
	if(imageList != null) {
		for(int i = 0;i < src.length;i++) {
			int srcIndex = src[i].lastIndexOf("/");
			String srcName = src[i].substring(srcIndex + 1);
			for(int j = 0;j < imageList.size();j++) {
				AddRequest addRequest = imageList.get(j);
				String realPath = addRequest.getRealPath();
				int addIndex = realPath.lastIndexOf(File.separator);
				String addString = realPath.substring(addIndex + 1);
				if(srcName.equals(addString)) {
					addRequest.setInto(true);
					break;
				}
			}
		}
	}
%>