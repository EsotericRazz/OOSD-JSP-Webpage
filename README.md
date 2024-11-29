# Travel Rewards Web Client
Made in collaboration with @[JessicaPLins]

A Java-based web client for managing travel rewards, built with JSP and JavaScript. This web application provides a user interface for interacting with the Travel Rewards REST API, featuring complete CRUD operations through an intuitive interface.

## Technologies Used
- Jakarta Server Pages (JSP) for server-side rendering
- JavaScript with jQuery for client-side interactions
- Bootstrap 5.3 for responsive styling
- AJAX for asynchronous API communication
- Java Servlets for request handling

## Features
- Dynamic rewards table with real-time updates
- Add/Edit reward form with validation
- Delete confirmation
- Responsive navigation
- Cross-origin API integration

## Prerequisites
- Java Development Kit (JDK) 17 or higher
- Apache Tomcat 10.x
- Travel Rewards REST API running (see [REST API Repository])

## Development Setup
1. Clone the repository
2. Configure API endpoint in `rewards.js`:
   ```javascript
   const API_URL = 'http://localhost:8080/TeamOneREST_war_exploded/api/rewards';
   const APP_URL = 'http://localhost:8081/T1TravelExpertsJSP_war_exploded/rewards';
   ```
   Adjust the URLs according to your deployment configuration.

3. Deploy to Tomcat:
    - Using IntelliJ IDEA: Configure Tomcat Server and deploy via IDE
    - Manual deployment: Build WAR file and deploy to Tomcat webapps directory

## Project Structure
```
src/main/
├── java/
│   └── team/one/t1travelexpertsjsp/
│       └── RewardsServlet.java
├── webapp/
│   ├── WEB-INF/
│   ├── reward.jsp
│   ├── rewards.jsp
│   └── rewards.js
```

## Key Components

### RewardsServlet
- Handles routing for rewards pages
- Manages URL patterns for viewing, creating, and editing rewards

### rewards.jsp
- Displays the main rewards listing page
- Features a dynamic table with CRUD operations
- Includes add new reward functionality

### reward.jsp
- Provides form for adding/editing rewards
- Implements client-side validation
- Handles both creation and update operations

### rewards.js
- Manages AJAX communication with REST API
- Handles dynamic UI updates
- Implements CRUD operations via API calls

## Deployment Notes
- The web client requires the REST API to be running and accessible
- CORS must be properly configured on the REST API
- For production deployment:
    - Update API endpoints in `rewards.js`
    - Configure appropriate error handling
    - Implement user authentication if required

## Browser Compatibility
- Tested on modern browsers (Chrome, Firefox, Safari)
- Requires JavaScript enabled
- Responsive design works on mobile devices

## Related Projects
- [REST API Repository] - Backend REST API

[//]: # (- [Android Client Repository] - Mobile client application)

[REST API Repository]: https://github.com/EsotericRazz/OOSD-REST-API
[JessicaPLins]: https://github.com/JessicaPLins

[//]: # ([Android Client Repository]: [Link to your Android repository])
