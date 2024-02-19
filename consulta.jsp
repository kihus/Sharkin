<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>
        tr:nth-child(even) {
            background-color: lightgray;
        }
        tr:hover{
            background-color: #6495ED;
        }
    </style>
</head>
<body>
    <%
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

        String sql = "SELECT * FROM usuarios" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        ResultSet  dados = stm.executeQuery() ;

        out.print("<table border=1 width='500'>");
        out.print("<tr>") ;
            out.print("<th>Codigo</th>") ;
            out.print("<th>Nome</th>") ;
            out.print("<th>Sobrenome</th>") ;
            out.print("<th>Email</th>") ;
            out.print("<th>Senha</th>") ;
            out.print("<th>Data Nascimento</th>") ;
        out.print("</tr>") ;
        while( dados.next() ) 
        {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("id") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("nome") ) ;
                out.print("</td>") ;
                
                out.print("<td>") ;
                    out.print( dados.getString("sobrenome") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("email") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("senha") ) ;
                out.print("</td>") ;  
                
                out.print("<td>") ;
                    out.print( dados.getString("data_nasc") ) ;
                out.print("</td>") ;                

            out.print("</tr>") ;

        }

        out.print("</table>") ;
    %>
</body>
</html>
