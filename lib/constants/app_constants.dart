class AppConstants {
  // Personal Information
  static const String name = "Neha Tanwar";
  static const String title = "Senior Mobile Application Developer";
  static const String email = "nehatanwar197@gmail.com";
  static const String location = "Noida, Uttar Pradesh, India";
  static const String linkedIn = "https://www.linkedin.com/in/neha-tanwar";

  // Summary
  static const String summary =
      "Experienced Mobile Developer with 4 years in mobile app development. "
      "Expertise in building high-performance, cross-platform apps for Android and iOS, "
      "leading development teams, and ensuring clean, maintainable code. "
      "Strong in integrating APIs, optimizing performance, and managing full app lifecycles "
      "from design to deployment.";

  // Experience
  static const List<Map<String, dynamic>> experience = [
    {
      'position': 'Sr. Flutter Developer',
      'company': 'Ongraph Technologies Pvt. Ltd.',
      'duration': 'Jan \'24 — Present',
      'location': 'Noida, India',
      'description': '',
    },
    {
      'position': 'Flutter Developer',
      'company': 'Abhay Techno Services Private Limited',
      'duration': 'Apr \'22 — Jan \'24',
      'location': 'Gurugram, India',
      'description': '',
    },
    {
      'position': 'Software Development Engineer',
      'company': 'Arvous Technology',
      'duration': 'Mar \'21 — Apr \'22',
      'location': 'Noida, India',
      'description': '',
    },
  ];

  // Projects
  static List<Map<String, dynamic>> projects = [
    {
      'title': 'S- Express',
      'subtitle': 'Money Transfer Application',
      'duration': '', // Add duration if available
      'company': '', // Add company name if available
      'description': 'A cross-platform money transfer application facilitating seamless '
          'transactions from Europe to Sudan. The app provides an intuitive interface '
          'for users to send money to their family and friends in Sudan, with support '
          'for multiple branches across Sudan for convenient fund collection.',
      'links': [
        {
          'title': 'Google Play Store',
          'url':
              'https://play.google.com/store/apps/details?id=com.sudanese_moneytransfer.app&hl=en_IN'
        },
        {
          'title': 'App Store',
          'url': 'https://apps.apple.com/us/app/s-express/id6452722018'
        },
      ],
      'keyPoints': [
        'Developed core application features and functionalities from ground up',
        'Integrated secure payment gateways for seamless international transactions',
        'Implemented robust error handling and transaction validation',
        'Built user-friendly interface for international money transfer workflow',
        'Ensured compliance with international money transfer regulations'
      ],
      'features': [
        'International Money Transfer: Secure transfers from Europe to Sudan',
        'Branch Network Integration: Support for multiple collection points',
        'Payment Gateway Integration: Secure and reliable transaction processing',
        'Transaction Tracking: Real-time status updates for transfers',
        'Multi-currency Support: Handling different currency conversions'
      ],
      'technologies': ['Flutter', 'Dart', 'Payment Integration', 'GIT'],
    },
    {
      'title': 'Zulu Travels',
      'subtitle': 'Social Travel Application',
      'duration': '', // Add duration if available
      'company': '', // Add company name if available
      'description': 'A travel-based social platform where users can share and explore '
          'travel experiences. The app integrates with TripAdvisor API to provide fresh '
          'content and leverages Google Maps for enhanced location-based services, creating '
          'an engaging social travel community.',
      'links': [
        {
          'title': 'App Store',
          'url':
              'https://apps.apple.com/us/app/zulu-travel/id1658401094' // Replace with actual link when available
        }
      ],
      'keyPoints': [
        'Integrated TripAdvisor API for automated content updates on social feed',
        'Implemented Google Maps and Places API for location-based services',
        'Built real-time social features using Firebase and Cloud Functions',
        'Designed and implemented scalable data structure with Firestore DB',
        'Created engaging UI/UX for social interaction and content sharing'
      ],
      'features': [
        'Social Feed: Real-time travel experience sharing',
        'Location Services: Integrated Google Maps for navigation',
        'Automated Content: TripAdvisor API integration for fresh content',
        'Real-time Updates: Live interaction using Firebase',
        'Place Discovery: Google Places API integration for location details',
        'Cloud Infrastructure: Scalable backend with Firebase services'
      ],
      'technologies': [
        'Flutter',
        'Dart',
        'Firebase',
        'Firestore DB',
        'Cloud Functions',
        'Google Maps API'
            'GIT'
      ],
    },
    {
      'title': 'Growth Club',
      'subtitle': 'Mobile Application Development',
      'duration': 'Nov 2023 - Jan 2024',
      'company': 'ATechnos',
      'description': 'This Flutter app, built with GetX for state management, offers a seamless '
          'experience for channel partners to track sales, earn rewards, and unlock exclusive perks. '
          'The app is designed with a focus on UI/UX to provide a clean, intuitive interface that '
          'enhances user engagement and ensures smooth navigation across both iOS and Android platforms.',
      'links': [
        {
          'title': 'Google Play Store',
          'url':
              'https://play.google.com/store/apps/details?id=com.almond.pepsicoapp'
        },
        {
          'title': 'App Store',
          'url': 'https://apps.apple.com/in/app/growth-club-app/id6474480095'
        },
      ],
      'keyPoints': [
        'Implemented state management using GetX framework for efficient data flow and reactive UI updates',
        'Integrated RESTful APIs for real-time data synchronization and backend communication',
        'Designed responsive UI components ensuring consistent experience across iOS and Android platforms',
        'Utilized Firebase services for authentication and real-time data management',
        'Implemented clean architecture principles for maintainable and scalable codebase'
      ],
      'features': [
        'Sales Tracking & Rewards: Earn points for each sale and unlock perks',
        'Real-Time Analytics: Gain valuable insights into performance and progress toward goals',
        'Partnership Tools: Build strong relationships with your network and foster trust',
        'Data-Driven Insights: Utilize tools that maximize ROI by analyzing performance',
        'REST API Integration: Seamlessly fetch and sync data with backend services',
        'Efficient Code Architecture: Developed with a robust architecture for scalability'
      ],
      'technologies': [
        'Flutter',
        'Firebase',
        'Dart',
        'REST APIs',
        'Responsive Web Design',
        'GetX',
        'Agile Methodologies',
        'GIT'
      ],
    },
    {
      'title': 'TESA CONNECT',
      'subtitle': 'Mobile Application Development',
      'duration': 'Apr 2023 - Nov 2023',
      'company': 'Action TESA',
      'description':
          'A mobile application bridging Action TESA brand with its partners '
              '(carpenters, contractors, architects, interior decorators). The app provides '
              'latest offerings, educational content, and product handling information while '
              'maintaining real-time updates and partner benefits.',
      'links': [
        {
          'title': 'Google Play Store',
          'url': 'https://play.google.com/store/search?q=tesa%20connect&c=apps'
        },
        {
          'title': 'App Store',
          'url': 'https://apps.apple.com/in/app/tesa-connect/id6450024483'
        },
      ],
      'keyPoints': [
        'Implemented user category management system for different partner types',
        'Developed real-time sale performance tracking and analytics',
        'Created dynamic functionality to accommodate various partner needs',
        'Integrated background data updates with proper widget state management',
        'Built educational content delivery system with video support'
      ],
      'features': [
        'User Management by Categories: Efficient partner categorization system',
        'Sale Performance Tracking: Real-time analytics and updates',
        'Dynamic Functionality: Complex features for diverse partner needs',
        'Background Data Updates: Seamless state management integration',
        'Educational Content: Video tutorials and product information delivery'
      ],
      'technologies': [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'GetX',
        'Mobile Technology',
        '3rd Party Integrations',
        'GIT'
      ],
    },
    {
      'title': 'Rishta Rewards',
      'subtitle': 'Cross-Platform E-commerce Application',
      'duration': 'Apr 2022 - Sep 2022',
      'company': 'Coca-Cola',
      'description': 'A cross-platform e-commerce application built with Flutter, '
          'integrating the Rishta Rewards loyalty program from Coca-Cola. The app '
          'provides an intuitive shopping experience with seamless performance across '
          'iOS and Android devices.',
      'links': [
        {
          'title': 'Google Play Store',
          'url':
              'https://play.google.com/store/apps/details?id=com.app.hccbLoyaltyProgram'
        },
        {
          'title': 'App Store',
          'url': 'https://apps.apple.com/in/app/rishta-rewards/id1631483264'
        },
      ],
      'keyPoints': [
        'Implemented responsive design principles for optimal display across all device sizes',
        'Utilized Provider pattern for efficient state management and real-time updates',
        'Developed clean, maintainable codebase using MVC architecture',
        'Integrated WebView for seamless display of external web content',
        'Implemented REST API integration for real-time data synchronization',
        'Set up Firebase notifications for real-time alerts and promotions'
      ],
      'features': [
        'Responsive Design: Dynamic layouts for phones and tablets',
        'State Management: Real-time updates with Provider pattern',
        'MVC Architecture: Scalable and maintainable codebase',
        'WebView Integration: Seamless external content display',
        'REST API Integration: Real-time backend communication',
        'Firebase Notifications: Instant alerts for rewards and promotions'
      ],
      'technologies': [
        'Flutter',
        'Dart',
        'Provider State Management',
        'Responsive Web Design',
        'Firebase',
        'REST APIs',
        'GIT',
        'Agile Methodologies',
        'Push Notifications'
      ],
    },
    {
      "title": "DREAMer's Roadmap",
      "subtitle": "Scholarship Discovery Platform",
      "duration": "",
      "company": "",
      "description":
          "A specialized mobile application designed for undocumented students and DACA recipients to discover and apply for educational scholarships. The platform provides comprehensive filtering tools, personalized scholarship matching, deadline notifications, and a community-driven approach to help students overcome financial barriers to higher education regardless of immigration status.",
      "links": [
        {
          "title": "Google Play Store",
          "url":
              "https://play.google.com/store/apps/details?id=com.dreamers.app"
        },
        {
          "title": "App Store",
          "url": "https://apps.apple.com/us/app/dreamers-roadmap/id1452722018"
        }
      ],
      "keyPoints": [
        "Developed a comprehensive scholarship discovery system targeting DACA and undocumented students",
        "Implemented advanced filtering capabilities based on eligibility, location, and education level",
        "Built notification system for scholarship deadline reminders",
        "Created user authentication with profile customization for personalized experience",
        "Integrated community features allowing users to suggest new scholarships"
      ],
      "features": [
        "Scholarship Discovery: Curated database of opportunities for undocumented students",
        "Advanced Filtering: Filter by state, eligibility status, education level, and due date",
        "Saved Scholarships: Bookmark and receive notifications for favorite opportunities",
        "User Profiles: Personalized experience based on education level and immigration status",
        "Scholarship Suggestions: Community-driven scholarship submissions and validation",
        "Resources Section: Educational guidance and additional support materials"
      ],
      "technologies": [
        "Flutter",
        "GetX",
        "Dio",
        "Firebase",
        "GetStorage",
        "REST API"
      ]
    }
  ];

  // Education
  static const Map<String, dynamic> education = {
    'degree':
        'Bachelor of computer science and Technology in Bachelor of Technology in Computer Science',
    'institution': 'Vidya College of Engineering',
    'location': 'Meerut, India',
    'duration': 'Aug \'14 — Aug \'18',
  };

  // Skills
  static const Map<String, List<String>> skills = {
    'Languages': ['Dart', 'Flutter', 'Core Java', 'Kotlin'],
    'State Management': ['Provider', 'Riverpod', 'GetX', 'BLOC'],
    'Tools & Platforms': [
      'Firebase',
      'RESTful APIs',
      'Git',
      'CI/CD',
      'TestFlight',
      'Google Play Console',
      'Xcode'
    ],
    'Architectures': ['MVC', 'MVVM', 'Clean Architecture'],
    'Agile Methodologies': ['Scrum', 'JIRA'],
    'Other Skills': ['Project Management', 'Mentorship', 'Code Review'],
  };

  // Social Links
  static const Map<String, String> socialLinks = {
    'LinkedIn': 'https://www.linkedin.com/in/neha-tanwar',
    'GitHub': 'https://github.com/nehatanwardev',
    'Email': 'mailto:nehatanwar197@gmail.com',
  };
}
