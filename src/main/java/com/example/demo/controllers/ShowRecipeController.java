package com.example.demo.controllers;

import com.example.demo.models.Recipe;
import com.example.demo.models.RecipeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowRecipe", value = "/show-recipe")
public class ShowRecipeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String user_prefix = request.getParameter("user-prefix");
       String recipe_prefix = request.getParameter("recipe-prefix");

        List<Recipe> recipeList = null;

        if (user_prefix!=null && recipe_prefix!=null){
            recipeList = RecipeDAO.getInstance().findOnPrefix(user_prefix,recipe_prefix);
       }
       else {
           recipeList = RecipeDAO.getInstance().allRecipes();
           }
        request.setAttribute("recipes",recipeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("all_recipes.jsp");
        dispatcher.forward(request, response);
       }
    }

