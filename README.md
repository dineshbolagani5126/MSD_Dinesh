# Exam Portal - Full Stack MERN Application

A comprehensive online examination system built with MongoDB, Express.js, React, and Node.js.

## Features

### User Management
- **Three User Roles**: Student, Faculty, and Admin
- **Secure Authentication**: JWT-based authentication with role-based access control
- **Password Management**: Password reset functionality via email
- **Session Management**: Prevents multiple concurrent logins

### Dashboard
- **Student Dashboard**: View upcoming exams, past results, performance overview, and notifications
- **Faculty Dashboard**: Manage exams, questions, evaluate submissions, and view analytics
- **Admin Dashboard**: System overview, user management, and comprehensive analytics

### Exam Management
- **Create & Schedule Exams**: Set duration, start/end times, and instructions
- **Flexible Configuration**: Support for randomized questions and negative marking
- **Department & Semester Filtering**: Target specific student groups
- **Publish Control**: Draft and publish exams when ready

### Question Bank
- **Multiple Question Types**: 
  - Multiple Choice Questions (MCQ)
  - True/False
  - Descriptive (Essay)
  - Coding Questions
- **Rich Metadata**: Tag questions by topic, difficulty, and subject
- **Bulk Operations**: Import multiple questions at once
- **Reusable Questions**: Build a comprehensive question repository

### Exam Interface
- **Timer**: Countdown timer with auto-submit on timeout
- **Question Navigation**: Easy navigation between questions
- **Auto-Save**: Automatic answer saving every 2 seconds
- **Progress Tracking**: Visual indicator of answered/unanswered questions
- **Randomization**: Questions randomized to prevent cheating

### Evaluation & Results
- **Auto-Grading**: Automatic evaluation for objective questions
- **Manual Grading**: Faculty can grade descriptive and coding questions
- **Detailed Feedback**: Provide feedback to students
- **Performance Analytics**: Subject-wise and overall performance tracking
- **Grade Calculation**: Automatic percentage and grade assignment

### Reports & Analytics
- **Student Performance**: Individual performance analysis with charts
- **Class Statistics**: Department and semester-wise analytics
- **Exam Analytics**: Pass/fail rates, score distribution, top performers
- **Subject-wise Analysis**: Performance breakdown by subject

### Security Features
- **Question Randomization**: Different question order for each student
- **Time Limits**: Strict exam duration enforcement
- **Session Control**: Prevent multiple simultaneous logins
- **Secure API**: Protected routes with JWT authentication
- **Rate Limiting**: Prevent API abuse

### Notification System
- **In-Portal Notifications**: Real-time notification system
- **Email Support**: Email notifications for important events
- **Priority Levels**: High, medium, and low priority notifications
- **Notification Types**: Exam, result, announcement, reminder, system

## Tech Stack

### Backend
- **Node.js**: Runtime environment
- **Express.js**: Web application framework
- **MongoDB**: NoSQL database
- **Mongoose**: MongoDB object modeling
- **JWT**: JSON Web Tokens for authentication
- **Bcrypt**: Password hashing
- **Nodemailer**: Email sending
- **Express Validator**: Input validation
- **Helmet**: Security headers
- **Morgan**: HTTP request logger
- **CORS**: Cross-origin resource sharing

### Frontend
- **React**: UI library
- **React Router**: Client-side routing
- **Axios**: HTTP client
- **Tailwind CSS**: Utility-first CSS framework
- **React Icons**: Icon library
- **React Toastify**: Toast notifications
- **Recharts**: Charting library
- **Date-fns**: Date utility library

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (v4.4 or higher)
- npm or yarn

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the backend directory:
```bash
cp .env.example .env
```

4. Update the `.env` file with your configuration:
```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/exam-portal
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRE=7d
NODE_ENV=development

# Email Configuration
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_password
EMAIL_FROM=noreply@examportal.com

# Frontend URL
FRONTEND_URL=http://localhost:5173
```

5. Start the backend server:
```bash
npm run dev
```

The backend server will run on `http://localhost:5000`

### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

The frontend will run on `http://localhost:5173`

## Usage

### First Time Setup

1. **Start MongoDB**: Ensure MongoDB is running on your system
2. **Start Backend**: Run `npm run dev` in the backend directory
3. **Start Frontend**: Run `npm run dev` in the frontend directory
4. **Register**: Create your first account at `http://localhost:5173/register`

### User Roles

#### Admin
- Full system access
- Manage all users, exams, and questions
- View system-wide analytics
- Default admin can be created by registering with role 'admin' (modify backend if needed)

#### Faculty
- Create and manage exams
- Build question bank
- Evaluate student submissions
- View exam analytics

#### Student
- View and take exams
- Check results and performance
- Track upcoming exams
- View notifications

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user
- `GET /api/auth/me` - Get current user
- `POST /api/auth/forgot-password` - Request password reset
- `PUT /api/auth/reset-password/:token` - Reset password
- `PUT /api/auth/update-password` - Update password

### Exams
- `GET /api/exams` - Get all exams
- `POST /api/exams` - Create exam (Faculty/Admin)
- `GET /api/exams/:id` - Get single exam
- `PUT /api/exams/:id` - Update exam (Faculty/Admin)
- `DELETE /api/exams/:id` - Delete exam (Faculty/Admin)
- `PATCH /api/exams/:id/publish` - Toggle publish status

### Questions
- `GET /api/questions` - Get all questions
- `POST /api/questions` - Create question (Faculty/Admin)
- `GET /api/questions/:id` - Get single question
- `PUT /api/questions/:id` - Update question
- `DELETE /api/questions/:id` - Delete question
- `POST /api/questions/bulk` - Bulk create questions

### Exam Attempts
- `POST /api/exam-attempts/start/:examId` - Start exam (Student)
- `PUT /api/exam-attempts/:attemptId/answer` - Save answer
- `POST /api/exam-attempts/:attemptId/submit` - Submit exam
- `GET /api/exam-attempts/my/:examId` - Get my attempt
- `GET /api/exam-attempts/exam/:examId` - Get all attempts (Faculty/Admin)
- `PUT /api/exam-attempts/:attemptId/evaluate` - Evaluate attempt

### Users
- `GET /api/users` - Get all users (Admin)
- `GET /api/users/:id` - Get single user
- `PUT /api/users/:id` - Update user (Admin)
- `DELETE /api/users/:id` - Delete user (Admin)
- `PATCH /api/users/:id/toggle-status` - Toggle user status

### Notifications
- `GET /api/notifications` - Get user notifications
- `PATCH /api/notifications/:id/read` - Mark as read
- `PATCH /api/notifications/read-all` - Mark all as read
- `DELETE /api/notifications/:id` - Delete notification

### Analytics
- `GET /api/analytics/dashboard` - Get dashboard stats
- `GET /api/analytics/exam/:examId` - Get exam analytics
- `GET /api/analytics/class` - Get class analytics

## Project Structure

```
exam-portal/
├── backend/
│   ├── config/
│   │   └── database.js
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── examController.js
│   │   ├── questionController.js
│   │   ├── examAttemptController.js
│   │   ├── userController.js
│   │   ├── notificationController.js
│   │   └── analyticsController.js
│   ├── middleware/
│   │   ├── auth.js
│   │   └── errorHandler.js
│   ├── models/
│   │   ├── User.js
│   │   ├── Question.js
│   │   ├── Exam.js
│   │   ├── ExamAttempt.js
│   │   └── Notification.js
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── examRoutes.js
│   │   ├── questionRoutes.js
│   │   ├── examAttemptRoutes.js
│   │   ├── userRoutes.js
│   │   ├── notificationRoutes.js
│   │   └── analyticsRoutes.js
│   ├── utils/
│   │   ├── sendEmail.js
│   │   └── generateToken.js
│   ├── .env.example
│   ├── package.json
│   └── server.js
│
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Layout.jsx
│   │   │   ├── Navbar.jsx
│   │   │   ├── Sidebar.jsx
│   │   │   ├── PrivateRoute.jsx
│   │   │   ├── Loading.jsx
│   │   │   ├── Timer.jsx
│   │   │   ├── StatCard.jsx
│   │   │   └── Modal.jsx
│   │   ├── context/
│   │   │   └── AuthContext.jsx
│   │   ├── pages/
│   │   │   ├── auth/
│   │   │   ├── student/
│   │   │   ├── faculty/
│   │   │   ├── admin/
│   │   │   └── common/
│   │   ├── utils/
│   │   │   ├── api.js
│   │   │   └── helpers.js
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   └── index.css
│   ├── index.html
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js
│
└── README.md
```

## Best Practices Implemented

- **Security**: JWT authentication, password hashing, input validation, rate limiting
- **Code Organization**: Modular structure with separation of concerns
- **Error Handling**: Comprehensive error handling and user-friendly messages
- **Scalability**: Efficient database queries with indexing
- **Responsive Design**: Mobile-friendly UI with Tailwind CSS
- **User Experience**: Loading states, toast notifications, intuitive navigation
- **Data Validation**: Both client-side and server-side validation
- **Clean Code**: Consistent naming conventions and code formatting

## Future Enhancements

- Real-time notifications using WebSockets
- Video proctoring during exams
- Advanced analytics with ML-based insights
- Mobile application (React Native)
- Bulk user import via CSV
- Question import from various formats
- Integration with LMS platforms
- Advanced question types (matching, ordering, etc.)
- Plagiarism detection for coding questions
- Multi-language support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the ISC License.

## Support

For support, email support@examportal.com or create an issue in the repository.

## Acknowledgments

- Built with MERN Stack
- UI inspired by modern design principles
- Icons from React Icons
- Charts from Recharts

---

**Note**: This is a complete, production-ready exam portal system. Make sure to update security configurations, especially JWT secrets and email credentials, before deploying to production.
