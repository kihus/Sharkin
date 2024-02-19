<%

  if( session != null ){
    session.invalidate() ;
    response.sendRedirect("login.html");
  }


%>