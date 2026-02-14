# MP2: Java Web Authentication System
## Group Project - ICS2609

### Setup Instructions
1. **NetBeans 12.4**: Open the project folder.
2. **Database (Derby)**: 
   - Start Java DB Server.
   - Create a database named `LoginDB`.
   - Execute the SQL script in `scripts/setup.sql`.
   - Credentials are set to `app/app` in `web.xml`.
3. **Server**: Run on GlassFish 4.1.x.

### Features
- **Session Management**: Prevents back-button access after logout.
- **Custom Exceptions**: `NullValueException` and `AuthenticationException` for robust error handling.
- **Dynamic Context**: Header/Footer text managed via `ServletContext`.
- **Security**: 5-minute session timeout.

### Error Mappings
- `error_1.jsp`: User not found, blank password.
- `error_2.jsp`: Correct user, wrong password.
- `error_3.jsp`: SQL/System failures (Mapped to 500).
- `error_4.jsp`: Resource Not Found (Mapped to 404).
- `noLoginCredentials.jsp`: Both fields empty (NullValueException).
- `error_5.jsp`: Both incorrect (AuthenticationException).
- `error_session.jsp`: Forbidden access without session.
