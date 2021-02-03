# simpleChat
Very simple demo chat app created by using Spring Boot /Vanilla js/ mssql

## How to run
Copy docker-compose folder and inside folder run 'docker-compose up'.
After the app started, go to "localhost:8080/index.html"

## What's implemented
### Rest api - used Spring Boot
Implemented:

GET /api/messages - get all messages

GET /api/messages?fromId - get all messages newer then message with id 'fromId'

POST /api/message?senderId - add new message for sender with id 'senderId'

### Frontend - used Vanilla js
Implemented:
- Preview of chat with all messages for user02 (id=2) - this is hardcoded since no Authentication is implemented
- Sending new messages for user02

### Database
Used Microsoft SQL server and DB and data initialized from sql script docker-compose/db/create-and-init-db-chatApp.sql
