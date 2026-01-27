# Lost and Found

A modern web application for managing lost and found items, built with Next.js and MongoDB. This platform helps users report lost items, post found items, and connect people with their missing belongings.

## Features

- **User Authentication**: Secure login and signup with JWT tokens and bcrypt password hashing
- **Item Management**: Create, view, and manage lost/found item tickets
- **Category Organization**: Items organized by categories for easy browsing
- **Responsive Design**: Mobile-friendly interface built with Tailwind CSS
- **Real-time Updates**: Dynamic ticket updates and notifications
- **Email Notifications**: Automated email system using Nodemailer
- **Image Upload**: Support for uploading images of lost/found items
- **User Dashboard**: Personalized dashboard to track your items

## Tech Stack

### Frontend
- **Next.js 13.5.6** - React framework with App Router
- **React 18** - UI library
- **Tailwind CSS** - Utility-first CSS framework
- **React Icons** - Icon library
- **React Hot Toast** - Toast notifications
- **React Dropzone** - File upload handling
- **FontAwesome** - Additional icons

### Backend
- **Next.js API Routes** - Serverless API endpoints
- **MongoDB** - NoSQL database
- **Mongoose** - MongoDB object modeling
- **JWT** - JSON Web Tokens for authentication
- **bcryptjs** - Password hashing
- **Nodemailer** - Email service

## Prerequisites

Before you begin, ensure you have the following installed:
- **Node.js** (v14 or higher)
- **npm** or **yarn**
- **MongoDB** (local or MongoDB Atlas account)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/suman-2212/Lost-and-Found.git
   cd Lost-and-Found
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   
   Create a `.env.local` file in the root directory and add the following variables:
   ```env
   # MongoDB Connection
   MONGODB_URI=your_mongodb_connection_string
   
   # JWT Secret
   TOKEN_SECRET=your_jwt_secret_key
   
   # Email Configuration (for Nodemailer)
   EMAIL_USER=your_email@example.com
   EMAIL_PASSWORD=your_email_password
   
   # Next.js
   NEXT_PUBLIC_API_URL=http://localhost:3000
   ```
   
   > **Note**: You can use `.env.example` as a reference template.

4. **Run the development server**
   ```bash
   npm run dev
   ```

5. **Open your browser**
   
   Navigate to [http://localhost:3000](http://localhost:3000)

## Project Structure

```
Lost-and-Found/
├── app/
│   ├── (components)/      # Reusable React components
│   ├── (dbConfig)/        # Database configuration
│   ├── (helpers)/         # Helper functions
│   ├── (models)/          # Mongoose models
│   ├── api/               # API routes
│   ├── login/             # Login page
│   ├── signup/            # Signup page
│   ├── TicketPage/        # Individual ticket view
│   ├── layout.js          # Root layout
│   ├── page.jsx           # Home/Dashboard page
│   └── globals.css        # Global styles
├── public/                # Static assets
├── matcher_service/       # Matching service (Python)
├── .env.example           # Environment variables template
├── next.config.js         # Next.js configuration
├── tailwind.config.js     # Tailwind CSS configuration
└── package.json           # Project dependencies
```

## Usage

### For Users Who Lost Items
1. Sign up or log in to your account
2. Click "Report Lost Item"
3. Fill in the details (description, category, location, date, etc.)
4. Upload images if available
5. Submit the ticket

### For Users Who Found Items
1. Sign up or log in to your account
2. Click "Report Found Item"
3. Provide item details and upload images
4. Submit the ticket

### Browsing Items
- View all lost/found items on the dashboard
- Items are organized by categories
- Click on any ticket to view full details
- Contact the poster if you have information

## Available Scripts

```bash
# Run development server
npm run dev

# Build for production
npm run build

# Start production server
npm start

# Run ESLint
npm run lint
```

## Deployment

### Deploy to Vercel (Recommended)

1. Push your code to GitHub
2. Import your repository on [Vercel](https://vercel.com)
3. Add environment variables in Vercel dashboard
4. Deploy!

### Other Platforms
This Next.js application can be deployed to any platform that supports Node.js applications, such as:
- Netlify
- Railway
- Render
- AWS
- DigitalOcean

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Author

**Suman M**
- GitHub: [@suman-2212](https://github.com/suman-2212)

## Acknowledgments

- Next.js team for the amazing framework
- MongoDB for the database solution
- All contributors who help improve this project

---

**Made with ❤️ by Suman M**