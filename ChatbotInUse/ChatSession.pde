void createChatSession() {
  botter = new Bot("super", dataPath(""));
  chatSession = new Chat(botter);
}

void sendToBot(String message) {
  String response = chatSession.multisentenceRespond(message);
  
  conversationBubbles.add(message, response);
}
