# Exam Portal - Complete Setup Guide

This guide will walk you through setting up the Exam Portal from scratch.

## Prerequisites

Before you begin, ensure you have the following installed:

1. **Node.js** (v14 or higher)
   - Download from: https://nodejs.org/
   - Verify installation: `node --version`

2. **MongoDB** (v4.4 or higher)
   - Download from: https://www.mongodb.com/try/download/community
   - Or use MongoDB Atlas (cloud): https://www.mongodb.com/cloud/atlas
   - Verify installation: `mongod --version`

3. **Git** (optional, for version control)
   - Download from: https://git-scm.com/

## Step-by-Step Setup

### Step 1: Start MongoDB

#### Option A: Local MongoDB
```bash
# Windows
mongod

# macOS/Linux
sudo systemctl start mongod
```

#### Option B: MongoDB Atlas (Cloud)
1. Create account at https://www.mongodb.com/cloud/atlas
2. Create a cluster
3. Get connection string
4. Use it in your `.env` file

### Step 2: Backend Setup

1. Open terminal and navigate to backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file:
```bash
# Windows
copy .env.example .env

# macOS/Linux
cp .env.example .env
```

4. Edit `.env` file with your settings:
```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/exam-portal
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
JWT_EXPIRE=7d
NODE_ENV=development

# Email Configuration (Gmail example)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your.email@gmail.com
EMAIL_PASSWORD=your_app_specific_password
EMAIL_FROM=noreply@examportal.com

FRONTEND_URL=http://localhost:5173
```

5. Start the backend server:
```bash
npm run dev
```

You should see:
```
Server running in development mode on port 5000
MongoDB Connected: localhost
```

### Step 3: Frontend Setup

1. Open a NEW terminal window and navigate to frontend directory:
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

You should see:
```
VITE v5.0.8  ready in XXX ms

➜  Local:   http://localhost:5173/
➜  Network: use --host to expose
```

### Step 4: Access the Application

1. Open your browser and go to: `http://localhost:5173`
2. You should see the login page

### Step 5: Create Your First User

1. Click "Sign up" on the login page
2. Fill in the registration form:
   - **For Admin**: Select role as "Faculty" (then manually change in database)
   - **For Faculty**: Select role as "Faculty"
   - **For Student**: Select role as "Student"
3. Click "Create Account"

### Step 6: Create Admin User (Optional)

If you need an admin user:

1. Register as a faculty user first
2. Open MongoDB Compass or mongo shell
3. Connect to your database
4. Find the user in the `users` collection
5. Update the role field to "admin"

Using MongoDB shell:
```javascript
use exam-portal
db.users.updateOne(
  { email: "your.email@example.com" },
  { $set: { role: "admin" } }
)
```

## Email Configuration (Gmail)

To enable email notifications:

1. Go to your Google Account settings
2. Enable 2-Step Verification
3. Generate an App Password:
   - Go to Security → 2-Step Verification → App passwords
   - Select "Mail" and your device
   - Copy the generated password
4. Use this password in your `.env` file as `EMAIL_PASSWORD`

## Testing the Application

### Test as Student

1. Register with role "Student"
2. Login with student credentials
3. You should see the student dashboard
4. Navigate through:
   - Dashboard
   - Exams (will be empty initially)
   - Results
   - Profile

### Test as Faculty

1. Register with role "Faculty"
2. Login with faculty credentials
3. You should see the faculty dashboard
4. Try creating:
   - Questions (Question Bank)
   - Exams (Manage Exams)

### Test as Admin

1. Create admin user (see Step 6)
2. Login with admin credentials
3. You should see the admin dashboard
4. Access all features:
   - User Management
   - System Analytics
   - All exams and questions

## Common Issues and Solutions

### Issue 1: MongoDB Connection Error
**Error**: `MongooseServerSelectionError: connect ECONNREFUSED`

**Solution**:
- Ensure MongoDB is running
- Check if the port is correct (default: 27017)
- Verify MONGODB_URI in `.env` file

### Issue 2: Port Already in Use
**Error**: `Port 5000 is already in use`

**Solution**:
- Change PORT in `.env` file to another port (e.g., 5001)
- Or kill the process using port 5000:
  ```bash
  # Windows
  netstat -ano | findstr :5000
  taskkill /PID <PID> /F

  # macOS/Linux
  lsof -ti:5000 | xargs kill -9
  ```

### Issue 3: Email Not Sending
**Error**: Email notifications not working

**Solution**:
- Verify EMAIL_USER and EMAIL_PASSWORD in `.env`
- Use App Password for Gmail (not regular password)
- Check if 2-Step Verification is enabled
- Ensure EMAIL_HOST and EMAIL_PORT are correct

### Issue 4: CORS Error
**Error**: `Access to XMLHttpRequest has been blocked by CORS policy`

**Solution**:
- Ensure backend is running on port 5000
- Check FRONTEND_URL in backend `.env`
- Verify proxy configuration in frontend `vite.config.js`

### Issue 5: JWT Token Invalid
**Error**: `Not authorized to access this route`

**Solution**:
- Clear browser localStorage
- Logout and login again
- Check if JWT_SECRET is set in `.env`

## Production Deployment

### Backend Deployment (Example: Heroku)

1. Create `Procfile`:
```
web: node server.js
```

2. Update environment variables on hosting platform

3. Use production MongoDB (MongoDB Atlas recommended)

### Frontend Deployment (Example: Vercel)

1. Build the frontend:
```bash
npm run build
```

2. Deploy the `dist` folder

3. Update API base URL for production

## Security Checklist for Production

- [ ] Change JWT_SECRET to a strong, random string
- [ ] Use environment-specific .env files
- [ ] Enable HTTPS
- [ ] Set NODE_ENV to "production"
- [ ] Use MongoDB Atlas with authentication
- [ ] Enable rate limiting
- [ ] Set up proper CORS origins
- [ ] Use secure cookies
- [ ] Implement proper logging
- [ ] Set up monitoring and alerts

## Next Steps

1. **Customize the Application**
   - Update branding and colors in Tailwind config
   - Modify email templates
   - Add custom features

2. **Add Sample Data**
   - Create sample questions
   - Set up test exams
   - Add demo users

3. **Configure Email Templates**
   - Customize notification emails
   - Add institution branding

4. **Set Up Backup**
   - Configure MongoDB backups
   - Set up automated backups

## Support

If you encounter any issues:

1. Check the console for error messages
2. Review the logs in terminal
3. Verify all environment variables
4. Ensure all services are running
5. Check MongoDB connection

## Useful Commands

```bash
# Backend
npm run dev          # Start development server
npm start           # Start production server

# Frontend
npm run dev         # Start development server
npm run build       # Build for production
npm run preview     # Preview production build

# MongoDB
mongod              # Start MongoDB
mongo               # Open MongoDB shell
```

## Resources

- [Node.js Documentation](https://nodejs.org/docs/)
- [Express.js Documentation](https://expressjs.com/)
- [React Documentation](https://react.dev/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)

---

**Congratulations!** You now have a fully functional Exam Portal system running locally. 🎉
