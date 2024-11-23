package team.one.t1travelexpertsjsp;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
/*
Author:Jessica Lins.
Date:November,2024

Defines a `RewardsServlet` that handles GET requests for the `/rewards/` URL pattern.

1. URL Splitting: It splits the request URI by `/` to determine if a `rewardId` is provided.
If the URI has four parts, it extracts the `rewardId` from the fourth segment.
2. Handling `rewardId`:
   - If the `rewardId` is `"new"`, the servlet forwards the request to the `reward.jsp` page for creating a new reward.
   - If a specific `rewardId` is provided, it sets the `rewardId` as a request attribute and forwards the request to `reward.jsp`.
3. Default Redirect: If no `rewardId` is provided, it forwards the request to the `rewards.jsp` page, which displays a list of rewards.
*/

@WebServlet(name = "rewardsServlet", value = "/rewards/*")
public class RewardsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            final var split = request.getRequestURI().split("/");
            String rewardId = split.length == 4 ? split[3] : null;
            if (rewardId != null) {
                if (rewardId.equals("new")) {
                    request.getRequestDispatcher("/reward.jsp").forward(request, response);
                    return;
                }

                request.setAttribute("rewardId", rewardId);
                request.getRequestDispatcher("/reward.jsp").forward(request, response);
                return;
            }

            request.getRequestDispatcher("/rewards.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}