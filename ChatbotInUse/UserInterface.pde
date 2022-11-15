void createUI() {
  controller = new GUIController(this);
  userInput = new IFTextField("User Input",0,height-80,width-150);
  enter = new IFButton("Enter", 395, height - 80, width-400);
  upload= new IFButton("Upload", 10, height -30, width-400);
  p = new IFProgressBar(100,height-30,width-150);
  ctitle = new IFLabel("Picture Editor",200,10);

  
  controller.add(userInput);
  userInput.setSize(390,40);
  userInput.addActionListener(this);
  controller.add(enter);
  enter.setSize(80,40);
  enter.addActionListener(this);
  controller.add(upload);
  upload.addActionListener(this);
  controller.add(p);
  p.setSize(200,20);
  controller.add(ctitle);
  
  titlecolor = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  titlecolor.baseColor = color(191, 157, 212);
  titlecolor.highlightColor = color(201, 97, 160);
  
  ctitle.setLookAndFeel(titlecolor);
  enter.setLookAndFeel(titlecolor);
  upload.setLookAndFeel(titlecolor);
  p.setLookAndFeel(titlecolor);
  
  chatFont = createFont("Comic Sans MS", 16);
  textFont(chatFont);
  
  conversationBubbles = new ConversationBubbles();
}

void actionPerformed(GUIEvent element) {
  if (element.getMessage().equals("Completed")) {
    String userMessage = userInput.getValue();
    userInput.setValue("");
    sendToBot(userMessage);
  }
  else if (element.getSource() == enter) {
    String userMessage = userInput.getValue();
    userInput.setValue("");
    sendToBot(userMessage);
  }
  else if (element.getSource() == upload) {
    
    
    selectInput("Select a file to process:", "fileSelected");
  }
}
