import interfascia.*;

import org.alicebot.ab.Bot;
import org.alicebot.ab.Chat;
import org.alicebot.ab.History;
import org.alicebot.ab.MagicBooleans;
import org.alicebot.ab.MagicStrings;
import org.alicebot.ab.utils.IOUtils;

// Uset interface elements
GUIController controller;
IFTextField userInput;
IFButton enter,upload;
IFProgressBar p;
IFLabel ctitle;
IFLookAndFeel titlecolor;
PFont chatFont;
PImage fresh;

// Chatbot elements
Bot botter;
Chat chatSession;
ConversationBubbles conversationBubbles;

void setup() {
  size(480, 700);
  fresh = loadImage("fresh.jpg");
  createUI();
  createChatSession();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

void draw() {
  background(222, 184, 192);
  image(fresh,0,height-fresh.height-80);
  conversationBubbles.display();
}
