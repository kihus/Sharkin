<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vnome      = request.getParameter("txtNome");
    String vsobreNome = request.getParameter("txtSobreNome");
    String vemail     = request.getParameter("txtEmail");
    String vsenha     = request.getParameter("txtSenha");
    String vDataNasc  = request.getParameter("txtDataNasc");

    //variaveis para o banco de dados
    String banco    = "web" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO usuarios (nome, sobrenome, email, senha, data_nasc) values (?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vnome) ;
    stm.setString( 2 , vsobreNome ) ;
    stm.setString( 3 , vemail ) ;
    stm.setString( 4, vsenha );
    stm.setString( 5, vDataNasc);

    stm.execute() ;
    stm.close() ;

    response.sendRedirect("obrigado-cadastro.html");
%>
