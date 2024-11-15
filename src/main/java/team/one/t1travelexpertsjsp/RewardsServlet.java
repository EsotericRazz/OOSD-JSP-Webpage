package team.one.t1travelexpertsjsp;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

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