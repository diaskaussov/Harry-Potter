# Harry Potter App 🧙‍♂️
Harry Potter App is an iOS application that allows users to explore the world of Harry Potter. It allows users to:
  - Explore the four Houses of Hogwarts School of Witchcraft and Wizardry
  - View characters associated with each House
  - See detailed information for each character
  - Browse a list of all available spells

The app fetches data from the [Harry Potter API](https://hp-api.onrender.com/).
App uses 5 main screens:
  1. Welcome Page
  2. Spells Screen
  3. Hogwarts Houses Selection Screen
  4. The House Description Screen
  5. List of Characters
  6. Character Details

## Technologies used
  - Swift
  - UIKit
  - SwiftUI
  - GCD
  - URLSession
  - JSON Parsing
  - MVVM and MVP architectures

## Screen 1 – Welcome Page

- Themed background featuring Platform 9¾
- A welcome message inviting users into the wizarding world or  
  prompting them to explore spells, displayed on an ancient-looking scrolls.
- The scrolls are interactive and respond to user taps to continue

<p align="middle">
<img src="https://github.com/user-attachments/assets/395684d5-ce76-4477-8c01-c7416d04acb1" width="191.17" height="400" />
  
## Screen 2 - Spells Screen

- API Integration
    - Connects to the [Harry Potter API](https://hp-api.onrender.com/)
    - Fetches spells' names and descriptions
    - Handles asynchronous network requests with proper error handling
- UI Components
  - Collection of spells
  - Each spell cell includes:
    - Image of magical wand
    - Name
    - Description  

<p align="middle">
<img src="https://github.com/user-attachments/assets/df73fe3e-16e2-47bf-9ec9-b2708fca4612" width="191.17" height="400" />

## Screen 3 - Hogwarts Houses Selection Screen

  - Four Hogwarts Houses are represented using UIButtons:
    - Gryffindor
    - Slytherin
    - Hufflepuff
    - Ravenclaw

  - Additional themed decorations like an owl and a scroll with a magical invitation

<p align="middle">
<img src="https://github.com/user-attachments/assets/94474d7d-0ac9-4c19-bf7b-ed23dfaf4edb" width="191.17" height="400" />

## Screen 4 - The House Description Screen
  - Each House section includes:
    - House emblem
    - House name
    - Description including its founder and core traits
  - Interactive scroll that navigates to the list of characters of the selected House

<p align="middle">
<img src="https://github.com/user-attachments/assets/152e766b-b7d1-49e8-bccc-05907b2357ef" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/49b2121e-d41b-42bf-8b79-d277bc0741c3" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/4a05cc7a-373b-4f2f-b4f8-87d8177c9a23" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/055c1640-c60b-4a35-89ae-2e8d4be06dd8" width="191.17" height="400" />

## Screen 5 - List of Characters
  - API Integration
    - Connects to the [Harry Potter API](https://hp-api.onrender.com/)
    - Fetches characters filtered by the selected House
    - Downloads and displays character images  
    (if there is no available character image, replaces with image of the House)
    - Handles asynchronous network requests with proper error handling 

  - UI Components
    - Collection of characters for the selected House
    - Search bar to filter characters by name
    - Each character cell includes:
      - Character image
      - Name
      - Status indicator (student or staff)
      - House-themed styling
  
  - Loading indicator shown while fetching data

<p align="middle">
<img src="https://github.com/user-attachments/assets/35bfdbe6-52ef-45d4-b3ec-eeb1e5743631" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/8ddcc411-2dc2-4d00-9d49-115f50c88267" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/897bc5ba-f70e-4e41-a805-50f1684ec20c" width="191.17" height="400" />
<!-- <img src="https://github.com/user-attachments/assets/999f0ba2-c2b3-4361-9dc8-122bd4082a60" width="191.17" height="400" /> -->
<!-- <img src="https://github.com/user-attachments/assets/10bf0256-6190-4cbd-8ed4-bed578059ba2" width="191.17" height="400" /> -->

## Screen 6 - Character Details
- Detailed profile view for individual characters
- Information displayed includes:
  - Image
  - Name
  - Species
  - Gender
  - House
  - Wizard status
  - Ancestry
  - Wand details
  - Patronus
  - Hogwarts role (student or staff)
  - Actor name
- Scrollable layout for detailed content
- Close button to return to the character list

<p align="middle">
<img src="https://github.com/user-attachments/assets/4bb19675-6b03-4b30-8607-f54bfdbf9990" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/3e470737-9f33-4c5e-8ce2-71fd598e49a7" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/5daa853a-baf8-46ee-8d4f-d4ee6d88b83b" width="191.17" height="400" />
<img src="https://github.com/user-attachments/assets/67ea9beb-120d-43c0-b839-43ef344b4fd2" width="191.17" height="400" />


