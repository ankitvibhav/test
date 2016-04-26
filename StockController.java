package controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StockController
 */
@WebServlet("/StockController")
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserStockDaoImpl obj=new UserStockDaoImpl();
	//	PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		String[] space= user.split(" ");
		if(space.length>1){
			request.setAttribute("error", "Exception occured!");
			RequestDispatcher rq=request.getRequestDispatcher("Error.jsp");
			rq.forward(request,response);
		}
		else{
		String[] company = request.getParameterValues("company");
		String status = obj.insertion(user,company);
		System.out.println(status);
		if(!status.equals("500")){
			request.setAttribute("time",status);
			request.setAttribute("user",user);
			request.setAttribute("company", company);
		RequestDispatcher rq=request.getRequestDispatcher("Success.jsp");
		rq.forward(request,response);
		}
		else{
			request.setAttribute("error", "Exception occured!");
			RequestDispatcher rq=request.getRequestDispatcher("Error.jsp");
			rq.forward(request,response);
		}
		// TODO Auto-generated method stub
	}
	}

}

